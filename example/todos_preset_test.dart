import 'dart:io';

import 'package:xcgrid_da/src/agent/preset_dispatcher.dart';
import 'package:xcgrid_da/src/agent/preset_manager.dart';
import 'package:xcgrid_da/src/preset/milestones.dart';
import 'package:xcgrid_da/xcrpc_api.dart';
import 'package:xcgrid_da/src/preset/milestones_loader.dart';

Future<void> main(List<String> arguments) async {
  var pm = XcClient().presetDispatcherAgent();
  String tag = 'store:Demo';
  String owner = 'samlet';
  // Create or load preset-pipeline
  var plOr = await pm.client.createPresetPl(
      MilestonesPresetKeys(todosId: 'todos_1')
          .asCallBuilderProto(tag, owner));

  MilestonesPreset preset = await pm.loadMilestonesPreset(plOr);
  print(preset.keys);
  var result=await preset.todosAddTodoCall("title", "cnt");
  print("add todo result: $result");

  exit(0);
}
