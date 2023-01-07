import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:protobuf/protobuf.dart';
import 'package:xcgrid_da/src/agent/preset_manager.dart';
import 'package:xcgrid_da/src/generated/domain/note_defs.pbenum.dart';
import 'package:xcgrid_da/src/generated/extra/common_slot.pb.dart';
import 'package:xcgrid_da/src/generated/google/protobuf/wrappers.pb.dart';
import 'package:xcgrid_da/src/generated/note_domain.pb.dart';
import 'package:xcgrid_da/src/preset/dummy.dart';
import 'package:xcgrid_da/src/xcrpc_client.dart';

Future<void> main(List<String> arguments) async {
  var pm = XcClient().presetManagerAgent();
  String tag = 'store:Demo';
  String owner = 'samlet';
  var plOr = await pm.client.createPresetPl(
      DummyPresetKeys(noteId: 'note_1', memoId: 'note_2')
          .asPlRequest(tag, owner));

  DummyPreset preset = await pm.loadDummyPreset(plOr);
  var cnt = await preset.memoSetContent('hi').memoGetNoteProtoCall();
  print('result -> ${cnt}');

  await testDispatch(preset);

  exit(0);
}

extension DummyLoader on PresetManagerAgent {
  Future<DummyPreset> loadDummyPreset(StringValue plOr) async {
    var meta = await loadPresetMeta(plOr);
    var keys = DummyPresetKeys.fromMeta(meta);
    var preset = DummyPreset(keys, presetAgent: this);
    return preset;
  }
}

Future<void> testDispatch(DummyPreset preset) async {
  preset.memoSetContent('hi').memoGetContent().memoGetNoteProto();
  var slots = await preset.dispatch();
  processSlotList(slots);
}

void processSlotList(SlotList slots) {
  // var fldsMapper = {};
  // slots.values.where((element) => element.slotSeq != 0).forEach((element) {
  //   fldsMapper[element.slotSeq] = element.slotData;
  // });
  // fldsMapper[NoteDefs.CONTENT.value]??

  var wrapper = SlotsWrapper(slots);
  var state = NoteState().copyWith(status: NoteStatus.loading, slots: wrapper);
  print(state);
}

class SlotsWrapper {
  final SlotList slots;
  Map<int, List<int>>? _values;

  Map<int, List<int>> get values => _values ??= buildValues();

  SlotsWrapper(this.slots);

  Map<int, List<int>> buildValues() {
    Map<int, List<int>> fldsMapper = {};
    slots.values.where((element) => element.slotSeq != 0).forEach((element) {
      fldsMapper[element.slotSeq] = element.slotData;
    });
    return fldsMapper;
  }

  String? asString(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return StringValue.fromBuffer(values[fldNumber]!).value;
    }
    return null;
  }

  int? asInt(int fldNumber) {
    if (values.containsKey(fldNumber)) {
      return Int32Value.fromBuffer(values[fldNumber]!).value;
    }
    return null;
  }

  T? asProto<T>(int fldNumber, Function(List<int>) prototype) {
    if (values.containsKey(fldNumber)) {
      return prototype(values[fldNumber]!);
    }
    return null;
  }
}

enum NoteStatus { initial, loading, success, failure }

class NoteState extends Equatable {
  final NoteStatus status;

  final String content;
  final String title;
  final ContentAndAuthor contentAndAuthor;
  final NoteProto note;

  NoteState({
    this.status = NoteStatus.initial,
    this.content = '',
    this.title = '',
    ContentAndAuthor? contentAndAuthor,
    NoteProto? note,
  })  :
        contentAndAuthor = contentAndAuthor ?? ContentAndAuthor.getDefault(),
        note = note ?? NoteProto.getDefault();

  NoteState copyWith({NoteStatus? status, SlotsWrapper? slots}) {
    return NoteState(
        status: status ?? this.status,
        content: slots?.asString(NoteDefs.CONTENT.value) ?? this.content,
        title: slots?.asString(NoteDefs.TITLE.value) ?? this.title,
        contentAndAuthor: slots?.asProto(NoteDefs.CONTENT_AND_AUTHOR.value,
                ContentAndAuthor.fromBuffer) ??
            this.contentAndAuthor,
        note: slots?.asProto(NoteDefs.DEFAULT_DOMAIN.value,
            NoteProto.fromBuffer) ??
            this.note
    );
  }

  @override
  List<Object?> get props => [status, content, title, contentAndAuthor, note];
}
