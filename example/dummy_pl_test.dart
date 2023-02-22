import 'dart:io';

import 'package:xcgrid_da/preset_common.dart';
import 'package:xcgrid_da/src/agent/pipelines.dart';
import 'package:xcgrid_da/src/agent/preset_dispatcher.dart';
import 'package:xcgrid_da/src/preset/dummy/dummy.dart';
import 'package:xcgrid_da/src/preset/milestones/milestones.dart';
import 'package:xcgrid_da/xcrpc_api.dart';

Future<void> main(List<String> arguments) async {
  var xc=XcClient();
  var pm = xc.presetDispatcherAgent();
  var pls=xc.pipelinesAgent();

  String tag = 'dummy:Demo';
  String owner = 'samlet';
  // Create or load preset-pipeline
  var plOr = await pm.client.createPresetPl(
      DummyPresetKeys(noteId: 'note_1', memoId: 'note_2', todosId: 'todos_1')
          .asCallBuilderProto(tag, owner));

  var cb = await pm.loadDummyPreset(plOr);
  print("preset-keys: ${cb.keys}");

  var cnt=await cb.memoGetContentCall();
  print("init memo.cnt: $cnt");

  // list proto
  CallBuilderListProto listProto = buildPresetPl(cb);

  // create
  var parentPlId = plOr.value;
  var result=await pls.callBuilderOnPlWithParentPl(listProto, parentPlId);
  // print("runtime-pl: ${result.fields['plId']?.stringValue}");
  print("runtime-pl: ${result.plXid.bundleId}");
  cnt=await cb.memoGetContentCall();
  print("memo.cnt: $cnt");  // world(2)

  // revoke
  // var plId=result.fields['plId']?.stringValue;
  var plId=result.plXid.bundleId;
  result = await pls.revokeCallBuilderOnPl(plId.proto);
  print("revoke result: $result");
  cnt=await cb.memoGetContentCall();
  print("after revoked, memo.cnt: $cnt"); // world(1)

  var rtPls=await pls.getRuntimePlIdsForPreset(plOr);
  print("rt-pls: $rtPls");

  exit(0);
}

CallBuilderListProto buildPresetPl(DummyPreset cb) {
  var builders = [
    cb.noteSetContent("hi").memoSetContent("world(1)").build(),
    cb
        .noteSetContent("hi")
        .memoSetContent("world(2)")
        .saga()
        .memoSetContent("world(1)")
        .build()
  ];

  var listProto = CallBuilderListProto()
    ..name = "Dummy"
    ..caller = "samlet"
    ..callBuilder.addAll(builders);
  return listProto;
}

