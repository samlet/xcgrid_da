part of 'milestones.dart';
enum MilestonesMethodDefs {
    noname, // 0
    todosAddTodo,    // Todos.addTodo
    todosAddTodoById,    // Todos.addTodoById
    todosGetPercentComplete,    // Todos.getPercentComplete
    todosGetTodoProtoList,    // Todos.getTodoProtoList
    todosGetTodosProto,    // Todos.getTodosProto
    todosGetWorkEffort,    // Todos.getWorkEffort
    todosMarkComplete,    // Todos.markComplete
    todosRemoveTodo,    // Todos.removeTodo
    todosUpdateTodo,    // Todos.updateTodo
}

enum MilestonesDomainDefs {
    nonDomainField, // 0

    // domain fields ---->
    // todos: [WorkEffortAuto, Todos]  
    todosWorkEffort,   // bluecc.work_effort.WorkEffortProto, WorkEffortAuto.getWorkEffort  
    todosPercentComplete,   // google.protobuf.Int64Value, Todos.getPercentComplete  
    todosDefaultDomain,   // domain.TodosProto, Todos.getTodosProto    
    // todos: enum values for list query ----->   
    // Todos.getTodoProtoList
    todosGetTodoProtoList,

    // todos: enum values for list muts ------>   
    // Todos.addTodoById
    todosAddTodoById,   
    // Todos.markComplete
    todosMarkComplete,   
    // Todos.addTodo
    todosAddTodo,   
    // Todos.removeTodo
    todosRemoveTodo,   
    // Todos.updateTodo
    todosUpdateTodo,           

}




