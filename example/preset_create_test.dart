import 'dart:io';

import 'package:xcgrid_da/src/agent/preset_manager.dart';
import 'package:xcgrid_da/src/generated/google/protobuf/wrappers.pb.dart';
import 'package:xcgrid_da/src/preset/dummy.dart';
import 'package:xcgrid_da/src/xcrpc_client.dart';

Future<void> main(List<String> arguments) async {
  var pm = XcClient().presetManagerAgent();
  String tag = 'store:Demo';
  String owner = 'samlet';
  var plOr = await pm.client.createPresetPl(
      DummyPresetKeys(noteId: 'note_1', memoId: 'note_2')
          .asPlRequest(tag, owner));

  DummyPreset preset = await loadPreset(pm, plOr);
  var cnt = await preset.memoSetContent('hi').memoGetContentCall();
  print('result -> ${cnt.value}');

  exit(0);
}

Future<DummyPreset> loadPreset(PresetManagerAgent pm, StringValue plOr) async {
  var meta = await pm.loadPresetMeta(plOr);
  var keys = DummyPresetKeys.fromMeta(meta);
  var preset = DummyPreset(keys, presetAgent: pm);
  return preset;
}
