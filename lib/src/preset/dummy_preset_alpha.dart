import 'package:protobuf/protobuf.dart';

import '../../common_proto.dart';
import '../agent/preset_manager.dart';
import '../generated/call_builder.pb.dart';
import '../preset_base.dart';
import '../xcrpc_client.dart';
import '../generated/note_co.pbgrpc.dart';
import '../util.dart';

class DummyPreset extends PresetBase {
  final BundleKey note;
  final BundleKey memo;

  DummyPreset(
      this.note,
      this.memo,
      {BundleKey? plKey, PresetManagerAgent? presetAgent})
      : super(presetAgent ?? XcClient().presetManagerAgent(),
            plKey ?? BundleKey(regionId: 'default', id: slugId()));

  NoteCoHandle get noteHandle {
    return NoteCoHandle()
      ..regionId = note.regionId
      ..bundleId = note.id;
  }

  NoteCoCall noteSetContent(String cnt) {
    var el = NoteCoCall()
      ..setContent = (NoteCoSetContentRequest()
        ..handle = noteHandle
        ..cnt = cnt
      );
    pushCall("noteSetContent", "NoteCo", note, el);
    return el;
  }

  // Future<StringValue> noteSetContentCall(String cnt) async {
  //   noteSetContent(cnt);
  //   var result= await presetAgent.dispatch(plKey.id, toProto());
  //   return StringValue.fromBuffer(result.values.last.writeToBuffer());
  // }

  Future<Empty> noteSetContentCall(String cnt) async {
    noteSetContent(cnt);
    await presetAgent.dispatch(plKey.id, toProto());
    return Empty.getDefault();
  }
}

