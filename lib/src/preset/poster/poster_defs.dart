part of 'poster.dart';

enum PosterMethodDefs {
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
    memoGetAttachments,    // WhiteBoard.getAttachments
    memoGetClob,    // WhiteBoard.getClob
    memoGetContentAndAuthor,    // WhiteBoard.getContentAndAuthor
    memoGetImages,    // WhiteBoard.getImages
    memoGetLastAuthor,    // WhiteBoard.getLastAuthor
    memoGetLastContent,    // WhiteBoard.getLastContent
    memoPersistSlotValues,    // WhiteBoard.persistSlotValues
    memoPersistSlotsExistent,    // WhiteBoard.persistSlotsExistent
    memoPutContent,    // WhiteBoard.putContent
    memoSetAttachments,    // WhiteBoard.setAttachments
    memoSetClob,    // WhiteBoard.setClob
    memoSetImages,    // WhiteBoard.setImages
    memoUpdateNote,    // WhiteBoard.updateNote
    memoUpdateNoteContent,    // WhiteBoard.updateNoteContent
}

enum PosterDomainDefs {
    nonDomainField, // 0
    // note: [NoteAuto, NoteCo]  
    noteClob,   // proto.BuffersData, NoteAuto.getClob  
    noteImages,   // proto.BuffersData, NoteAuto.getImages  
    noteAttachments,   // proto.BuffersData, NoteAuto.getAttachments  
    noteAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent  
    notePersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues  
    noteTitle,   // google.protobuf.StringValue, NoteCo.name  
    noteContent,   // google.protobuf.StringValue, NoteCo.getContent  
    noteDefaultDomain,   // domain.NoteProto, NoteCo.getNoteProto
    // memo: [NoteAuto, WhiteBoard]  
    memoClob,   // proto.BuffersData, NoteAuto.getClob  
    memoImages,   // proto.BuffersData, NoteAuto.getImages  
    memoAttachments,   // proto.BuffersData, NoteAuto.getAttachments  
    memoAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent  
    memoPersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues  
    memoLastContent,   // google.protobuf.StringValue, WhiteBoard.getLastContent  
    memoLastAuthor,   // google.protobuf.StringValue, WhiteBoard.getLastAuthor  
    memoContentAndAuthor,   // domain.ContentAndAuthor, WhiteBoard.getContentAndAuthor    
    // note: enum values for list query

    // note: enum values for list muts    
    // memo: enum values for list query

    // memo: enum values for list muts       
}




