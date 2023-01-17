part of 'milestones.dart';

enum MilestonesMethodDefs {
    noname, // 0
    todosAddTodo,    // Todos.addTodo
    todosAddTodoById,    // Todos.addTodoById
    todosGetPercentComplete,    // Todos.getPercentComplete
    todosGetTodoProtoList,    // Todos.getTodoProtoList
    todosGetTodosProto,    // Todos.getTodosProto
    todosMarkComplete,    // Todos.markComplete
    todosRemoveTodo,    // Todos.removeTodo
    todosUpdateTodo,    // Todos.updateTodo
}

enum MilestonesDomainDefs {
    nonDomainField, // 0
    // todos: [WorkEffortAuto, Todos]  
    todosPercentComplete,   // google.protobuf.Int64Value, Todos.getPercentComplete  
    todosDefaultDomain,   // domain.TodosProto, Todos.getTodosProto    
    // todos: enum values for list query   
    todosGetTodoProtoList,

    // todos: enum values for list muts   
    todosAddTodo,   
    todosRemoveTodo,   
    todosUpdateTodo,   
    todosAddTodoById,   
    todosMarkComplete,       
}




