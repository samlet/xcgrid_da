enum DummyMethodDefs {
    noname, // 0
    noteGetAttachments,    // NoteAuto.getAttachments
    noteGetClob,    // NoteAuto.getClob
    noteGetContent,    // NoteCo.getContent
    noteGetImages,    // NoteAuto.getImages
    noteGetNoteProto,    // NoteCo.getNoteProto
    noteName,    // NoteCo.name
    notePersistSlotValues,    // NoteAuto.persistSlotValues
    notePersistSlotsExistent,    // NoteAuto.persistSlotsExistent
    noteRevokeContent,    // NoteCo.revokeContent
    noteSetAttachments,    // NoteAuto.setAttachments
    noteSetClob,    // NoteAuto.setClob
    noteSetContent,    // NoteCo.setContent
    noteSetContentComp,    // NoteCo.setContentComp
    noteSetImages,    // NoteAuto.setImages
    noteUpdateNote,    // NoteAuto.updateNote
    noteUpdateNoteContent,    // NoteAuto.updateNoteContent
    memoGetAttachments,    // NoteAuto.getAttachments
    memoGetClob,    // NoteAuto.getClob
    memoGetContent,    // NoteCo.getContent
    memoGetImages,    // NoteAuto.getImages
    memoGetNoteProto,    // NoteCo.getNoteProto
    memoName,    // NoteCo.name
    memoPersistSlotValues,    // NoteAuto.persistSlotValues
    memoPersistSlotsExistent,    // NoteAuto.persistSlotsExistent
    memoRevokeContent,    // NoteCo.revokeContent
    memoSetAttachments,    // NoteAuto.setAttachments
    memoSetClob,    // NoteAuto.setClob
    memoSetContent,    // NoteCo.setContent
    memoSetContentComp,    // NoteCo.setContentComp
    memoSetImages,    // NoteAuto.setImages
    memoUpdateNote,    // NoteAuto.updateNote
    memoUpdateNoteContent,    // NoteAuto.updateNoteContent
    todosAddTodo,    // Todos.addTodo
    todosAddTodoById,    // Todos.addTodoById
    todosGetPercentComplete,    // Todos.getPercentComplete
    todosGetTodoProtoList,    // Todos.getTodoProtoList
    todosGetTodosProto,    // Todos.getTodosProto
    todosMarkComplete,    // Todos.markComplete
    todosRemoveTodo,    // Todos.removeTodo
    todosUpdateTodo,    // Todos.updateTodo
}

enum DummyDomainDefs {
    nonDomainField, // 0
    // note: [NoteAuto, NoteCo]  
    noteAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent  
    notePersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues  
    noteAttachments,   // proto.BuffersData, NoteAuto.getAttachments  
    noteClob,   // proto.BuffersData, NoteAuto.getClob  
    noteImages,   // proto.BuffersData, NoteAuto.getImages  
    noteTitle,   // google.protobuf.StringValue, NoteCo.name  
    noteContent,   // google.protobuf.StringValue, NoteCo.getContent  
    noteDefaultDomain,   // domain.NoteProto, NoteCo.getNoteProto
    // memo: [NoteAuto, NoteCo]  
    memoAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent  
    memoPersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues  
    memoAttachments,   // proto.BuffersData, NoteAuto.getAttachments  
    memoClob,   // proto.BuffersData, NoteAuto.getClob  
    memoImages,   // proto.BuffersData, NoteAuto.getImages  
    memoTitle,   // google.protobuf.StringValue, NoteCo.name  
    memoContent,   // google.protobuf.StringValue, NoteCo.getContent  
    memoDefaultDomain,   // domain.NoteProto, NoteCo.getNoteProto
    // todos: [WorkEffortAuto, Todos]  
    todosPercentComplete,   // google.protobuf.Int64Value, Todos.getPercentComplete  
    todosDefaultDomain,   // domain.TodosProto, Todos.getTodosProto    
    // enum values for list query

    // enum values for list muts    
    // enum values for list query

    // enum values for list muts    
    // enum values for list query   
    todosGetTodoProtoList,

    // enum values for list muts   
    todosAddTodoById,   
    todosMarkComplete,   
    todosAddTodo,   
    todosRemoveTodo,   
    todosUpdateTodo,       
}




