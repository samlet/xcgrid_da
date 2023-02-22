import 'dart:io';

import 'package:xcgrid_da/todos_on_web.dart';

Future<void> main(List<String> arguments) async {
  var todos = TodosOnWeb(bundleId: 'todos_1');
  await todos.addTodo('welcome', 'just a greet');
  var todoNames = await todos.getTodos();
  print("todos -> $todoNames");

  var allItems = await todos.getTodoProtoList();
  print("items for ${todos.bundleId}");
  allItems.items.forEach((element) {
    print("- ${element.title} => ${element}");
  });
  exit(0);
}

