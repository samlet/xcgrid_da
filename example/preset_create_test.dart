import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:xcgrid_da/src/agent/preset_manager.dart';
import 'package:xcgrid_da/src/bloc_util.dart';
import 'package:xcgrid_da/src/generated/domain/note_defs.pbenum.dart';
import 'package:xcgrid_da/src/generated/extra/common_slot.pb.dart';
import 'package:xcgrid_da/src/generated/google/protobuf/wrappers.pb.dart';
import 'package:xcgrid_da/src/generated/note_domain.pb.dart';
import 'package:xcgrid_da/src/preset/dummy.dart';
import 'package:xcgrid_da/src/preset/dummy_defs.dart';
import 'package:xcgrid_da/src/preset/dummy_loader.dart';
import 'package:xcgrid_da/src/preset_base.dart';
import 'package:xcgrid_da/src/preset_cubit.dart';
import 'package:xcgrid_da/src/xcrpc_client.dart';

Future<void> main(List<String> arguments) async {
  var pm = XcClient().presetManagerAgent();
  String tag = 'store:Demo';
  String owner = 'samlet';
  // Create or load preset-pipeline
  var plOr = await pm.client.createPresetPl(
      DummyPresetKeys(noteId: 'note_1', memoId: 'note_2')
          .asPlRequest(tag, owner));

  DummyPreset preset = await pm.loadDummyPreset(plOr);
  var cnt = await preset.memoSetContentComp('hi').memoGetNoteProtoCall();
  print('result -> ${cnt}');

  await testDispatch(preset);
  await testCubit(pm);

  exit(0);
}

Future<void> testDispatch(DummyPreset preset) async {
  preset.memoSetContentComp('hi').memoGetContent().memoGetNoteProto();
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

Future<void> testCubit(PresetManagerAgent pm) async {
  initBlocObserver();

  var cubit = NoteCubit(pm);
  print("init: ${cubit.state}");

  var presetKeys = DummyPresetKeys(noteId: 'note_1', memoId: 'note_2');
  await cubit.loadPreset(presetKeys, 'store:Demo', 'samlet');
  print("after load-preset: ${cubit.state}");
  await cubit.memoSetContent('hi, cubit');
  print("after set-cnt: ${cubit.state}");

  /// Close the `cubit` when it is no longer needed.
  cubit.close();
}


class NoteCubit extends PresetCubit<NoteState> {

  @override
  DummyPreset? preset;
  // NoteCubit(super.initialState, super.presetAgent);
  NoteCubit(PresetManagerAgent presetAgent) : super(NoteState(), presetAgent);

  Future<void> loadPreset(
      DummyPresetKeys presetKeys, String tag, String owner) async {
    var requestKeys = presetKeys.asPlRequest(tag, owner);

    emit(state.copyWith(status: NoteStatus.loading));

    try {
      // Init preset
      var plOr = await presetAgent.client.createPresetPl(requestKeys);
      preset = await presetAgent.loadDummyPreset(plOr);

      // Init state with loaders
      preset!.memoGetContent().memoGetNoteProto();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);
      emit(state.copyWith(status: NoteStatus.success, slots: wrapper));
    } on Exception {
      emit(state.copyWith(status: NoteStatus.failure));
    }
  }

  // Future<void> memoSetContent(String cnt) async {
  //   if (preset == null) return;
  //
  //   emit(state.copyWith(status: NoteStatus.loading));
  //   try {
  //     preset!.memoSetContent(cnt).memoGetContent().memoGetNoteProto();
  //     var slots = await preset!.dispatch();
  //     var wrapper = SlotsWrapper(slots);
  //     emit(state.copyWith(status: NoteStatus.success, slots: wrapper));
  //   } on Exception {
  //     emit(state.copyWith(status: NoteStatus.failure));
  //   }
  // }

  Future<void> memoSetContent(
      String cnt
  ) async {
    await mut(() => preset!.memoSetContentComp(cnt)
        .memoGetContent()
    );
  }

  Future<void> mut(Function() builder) async {
    if (!state.status.isSuccess) return;
    if (preset == null) return;

    // emit(state.copyWith(status: NoteStatus.loading));
    try {
      // preset!.memoSetContent(cnt).memoGetContent().memoGetNoteProto();
      builder();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);
      // emit(state.copyWith(status: NoteStatus.success, slots: wrapper));
      emit(state.copyWith(slots: wrapper));
    } on Exception catch(e){
      // emit(state.copyWith(status: NoteStatus.failure));
      print("fail: $e");
      emit(state);
    }
  }
}

enum NoteStatus { initial, loading, success, failure }
extension NoteStatusX on NoteStatus {
  bool get isInitial => this == NoteStatus.initial;
  bool get isLoading => this == NoteStatus.loading;
  bool get isSuccess => this == NoteStatus.success;
  bool get isFailure => this == NoteStatus.failure;
}

class NoteState extends Equatable {
  final NoteStatus status;

  final String content;
  // final String noteContent;
  final String title;
  final String author;
  // final List<int> bytes;

  // set contentAndAuthor(ContentAndAuthor)
  // set note(NoteProto proto)

  NoteState({
    this.status = NoteStatus.initial,
    this.content = '',
    this.title = '',
    this.author = '',
    // this.bytes = const [],
    // ContentAndAuthor? contentAndAuthor,
    // NoteProto? note,
  });

  // : contentAndAuthor = contentAndAuthor ?? ContentAndAuthor.getDefault(),
  //   note = note ?? NoteProto.getDefault();

  NoteState copyWith({NoteStatus? status, SlotsWrapper? slots}) {
    String? content;
    String? title;
    String? author;

    // from complicated
    ContentAndAuthor? contentAndAuthor = slots?.asProto(
        NoteDefs.CONTENT_AND_AUTHOR.value, ContentAndAuthor.fromBuffer);
    // ContentAndAuthor? contentAndAuthor = slots?.asProto(
    //         DummyDefs.NOTE_CONTENT_AND_AUTHOR.value, ContentAndAuthor.fromBuffer);
    if (contentAndAuthor != null) {
      content = contentAndAuthor.content;
      author = contentAndAuthor.author;
    }

    NoteProto? note =
        slots?.asProto(NoteDefs.DEFAULT_DOMAIN.value, NoteProto.fromBuffer);
    if (note != null) {
      title = note.title;
      content = note.content;
      author = note.author;
    }

    // from scalar
    content = slots?.asString(NoteDefs.CONTENT.value) ?? content;
    // content = slots?.asString(DummyDomainDefs.noteContent.index) ?? content;
    title = slots?.asString(NoteDefs.TITLE.value) ?? title;

    return NoteState(
      status: status ?? this.status,
      content: content ?? this.content,
      title: title ?? this.title,
      author: author ?? this.author,
      // contentAndAuthor: slots?.asProto(NoteDefs.CONTENT_AND_AUTHOR.value,
      //         ContentAndAuthor.fromBuffer) ??
      //     this.contentAndAuthor,
      // note: slots?.asProto(
      //         NoteDefs.DEFAULT_DOMAIN.value, NoteProto.fromBuffer) ??
      //     this.note
    );
  }

  @override
  List<Object?> get props => [
        status, content, title, author
        // contentAndAuthor, note
      ];
}
