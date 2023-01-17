import 'dart:io';

import 'package:xcgrid_da/src/agent/preset_dispatcher.dart';
import 'package:xcgrid_da/src/agent/preset_manager.dart';
import 'package:xcgrid_da/src/preset/milestones/milestones.dart';
import 'package:xcgrid_da/xcrpc_api.dart';

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

  var todos = await preset.todosGetTodoProtoListCall();
  print("items: $todos");

  var firstItem=todos.items.first.itemId;
  await preset.todosUpdateTodoCall(firstItem, 'title', 'description');

  var result = await preset.todosAddTodoCall("title", "cnt");
  print("add todo result: $result");

  todos = await preset.todosGetTodoProtoListCall();
  todos.items.forEach((element) {
    print(element);
  });

  exit(0);
}
