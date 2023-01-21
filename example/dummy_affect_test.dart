import 'dart:io';

import 'package:xcgrid_da/preset_common.dart';
import 'package:xcgrid_da/src/preset/dummy/dummy.dart';

Future<void> main(List<String> arguments) async {
  var pm = XcClient().presetDispatcherAgent();
  await testCubitWithList(pm);

  exit(0);
}

Future<void> testCubitWithList(PresetDispatcherAgent pm) async {
  // initBlocObserver();

  var repos=DummyRepository(pm);
  var cubit = DummyCubit(repos);
  var listCubit=DummyTodos_TodoListCubit(repository: repos);
  print("init: ${cubit.state}");

  var presetKeys =
  DummyPresetKeys(noteId: 'note_1', memoId: 'note_2', todosId: 'todos_1');
  await cubit.loadPreset(presetKeys, 'store:Demo', 'samlet');
  print("after load-preset: ${cubit.state}");
  await cubit.memoSetContent('hi, cubit');
  print("after set-cnt: ${cubit.state}");

  // await listCubit.todosGetTodoProtoList(); // 已经由事件触发自动加载
  // sleep(const Duration(seconds: 1));
  await waitSecs(1);
  print("state.items: ${listCubit.state}");

  // get and update
  var firstItem=listCubit.state.items.first.id;
  print("get and update $firstItem");
  await listCubit.updateTodo(firstItem, 'new title', 'new desc');
  print("after update, state.items: ${listCubit.state}");

  await listCubit.removeTodo(firstItem);
  print("wait a second");
  // sleep(const Duration(seconds: 1));
  await waitSecs(1);
  print("after remove, state.items: ${listCubit.state}");

  await listCubit.addTodo('another title', 'another desc');
  print("after add, state.items: ${listCubit.state}");

  firstItem=listCubit.state.items.first.id;
  await listCubit.markComplete(firstItem);
  await waitSecs(1);

  print("percent -> ${cubit.state.todosPercentComplete}");  // 33

  /// Close the `cubit` when it is no longer needed.
  cubit.close();
}
