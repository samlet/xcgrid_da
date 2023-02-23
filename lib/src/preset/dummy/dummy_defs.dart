part of 'dummy.dart';
enum DummyMethodDefs {
    noname, // 0
    noteGetAttachmentsSlot,    // NoteAuto.getAttachmentsSlot
    noteGetClobSlot,    // NoteAuto.getClobSlot
    noteGetContent,    // NoteCo.getContent
    noteGetImagesSlot,    // NoteAuto.getImagesSlot
    noteGetNote,    // NoteAuto.getNote
    noteGetNoteProto,    // NoteCo.getNoteProto
    noteName,    // NoteCo.name
    notePersistSlotValues,    // NoteAuto.persistSlotValues
    notePersistSlotsExistent,    // NoteAuto.persistSlotsExistent
    noteRevokeContent,    // NoteCo.revokeContent
    noteSetAttachmentsSlot,    // NoteAuto.setAttachmentsSlot
    noteSetClobSlot,    // NoteAuto.setClobSlot
    noteSetContent,    // NoteCo.setContent
    noteSetContentComp,    // NoteCo.setContentComp
    noteSetImagesSlot,    // NoteAuto.setImagesSlot
    noteUpdateNote,    // NoteAuto.updateNote
    noteUpdateNoteContent,    // NoteAuto.updateNoteContent
    memoGetAttachmentsSlot,    // NoteAuto.getAttachmentsSlot
    memoGetClobSlot,    // NoteAuto.getClobSlot
    memoGetContent,    // NoteCo.getContent
    memoGetImagesSlot,    // NoteAuto.getImagesSlot
    memoGetNote,    // NoteAuto.getNote
    memoGetNoteProto,    // NoteCo.getNoteProto
    memoName,    // NoteCo.name
    memoPersistSlotValues,    // NoteAuto.persistSlotValues
    memoPersistSlotsExistent,    // NoteAuto.persistSlotsExistent
    memoRevokeContent,    // NoteCo.revokeContent
    memoSetAttachmentsSlot,    // NoteAuto.setAttachmentsSlot
    memoSetClobSlot,    // NoteAuto.setClobSlot
    memoSetContent,    // NoteCo.setContent
    memoSetContentComp,    // NoteCo.setContentComp
    memoSetImagesSlot,    // NoteAuto.setImagesSlot
    memoUpdateNote,    // NoteAuto.updateNote
    memoUpdateNoteContent,    // NoteAuto.updateNoteContent
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

enum DummyDomainDefs {
    nonDomainField, // 0

    // domain fields ---->
    // note: [NoteAuto, NoteCo]  
    noteNote,   // bluecc.note.NoteProto, NoteAuto.getNote  
    noteAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent  
    notePersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues  
    noteClobSlot,   // proto.BuffersData, NoteAuto.getClobSlot  
    noteImagesSlot,   // proto.BuffersData, NoteAuto.getImagesSlot  
    noteAttachmentsSlot,   // proto.BuffersData, NoteAuto.getAttachmentsSlot  
    noteTitle,   // google.protobuf.StringValue, NoteCo.name  
    noteContent,   // google.protobuf.StringValue, NoteCo.getContent  
    noteDefaultDomain,   // bluecc.note.NoteProto, NoteCo.getNoteProto
    // memo: [NoteAuto, NoteCo]  
    memoNote,   // bluecc.note.NoteProto, NoteAuto.getNote  
    memoAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent  
    memoPersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues  
    memoClobSlot,   // proto.BuffersData, NoteAuto.getClobSlot  
    memoImagesSlot,   // proto.BuffersData, NoteAuto.getImagesSlot  
    memoAttachmentsSlot,   // proto.BuffersData, NoteAuto.getAttachmentsSlot  
    memoTitle,   // google.protobuf.StringValue, NoteCo.name  
    memoContent,   // google.protobuf.StringValue, NoteCo.getContent  
    memoDefaultDomain,   // bluecc.note.NoteProto, NoteCo.getNoteProto
    // todos: [WorkEffortAuto, Todos]  
    todosWorkEffort,   // bluecc.work_effort.WorkEffortProto, WorkEffortAuto.getWorkEffort  
    todosPercentComplete,   // google.protobuf.Int64Value, Todos.getPercentComplete  
    todosDefaultDomain,   // domain.TodosProto, Todos.getTodosProto    
    // note: enum values for list query ----->

    // note: enum values for list muts ------>    
    // memo: enum values for list query ----->

    // memo: enum values for list muts ------>    
    // todos: enum values for list query ----->   
    // Todos.getTodoProtoList
    todosGetTodoProtoList,

    // todos: enum values for list muts ------>   
    // Todos.addTodo
    todosAddTodo,   
    // Todos.removeTodo
    todosRemoveTodo,   
    // Todos.updateTodo
    todosUpdateTodo,   
    // Todos.addTodoById
    todosAddTodoById,   
    // Todos.markComplete
    todosMarkComplete,           

}




