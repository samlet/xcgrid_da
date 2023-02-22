part of 'poster.dart';
enum PosterMethodDefs {
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
    memoGetAttachmentsSlot,    // WhiteBoard.getAttachmentsSlot
    memoGetClobSlot,    // WhiteBoard.getClobSlot
    memoGetContentAndAuthor,    // WhiteBoard.getContentAndAuthor
    memoGetImagesSlot,    // WhiteBoard.getImagesSlot
    memoGetLastAuthor,    // WhiteBoard.getLastAuthor
    memoGetLastContent,    // WhiteBoard.getLastContent
    memoGetNote,    // WhiteBoard.getNote
    memoPersistSlotValues,    // WhiteBoard.persistSlotValues
    memoPersistSlotsExistent,    // WhiteBoard.persistSlotsExistent
    memoPutContent,    // WhiteBoard.putContent
    memoSetAttachmentsSlot,    // WhiteBoard.setAttachmentsSlot
    memoSetClobSlot,    // WhiteBoard.setClobSlot
    memoSetImagesSlot,    // WhiteBoard.setImagesSlot
    memoUpdateNote,    // WhiteBoard.updateNote
    memoUpdateNoteContent,    // WhiteBoard.updateNoteContent
}

enum PosterDomainDefs {
    nonDomainField, // 0

    // domain fields ---->
    // note: [NoteAuto, NoteCo]  
    noteAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent  
    notePersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues  
    noteClobSlot,   // proto.BuffersData, NoteAuto.getClobSlot  
    noteImagesSlot,   // proto.BuffersData, NoteAuto.getImagesSlot  
    noteAttachmentsSlot,   // proto.BuffersData, NoteAuto.getAttachmentsSlot  
    noteNote,   // bluecc.note.NoteProto, NoteAuto.getNote  
    noteTitle,   // google.protobuf.StringValue, NoteCo.name  
    noteContent,   // google.protobuf.StringValue, NoteCo.getContent  
    noteDefaultDomain,   // bluecc.note.NoteProto, NoteCo.getNoteProto
    // memo: [NoteAuto, WhiteBoard]  
    memoAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent  
    memoPersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues  
    memoClobSlot,   // proto.BuffersData, NoteAuto.getClobSlot  
    memoImagesSlot,   // proto.BuffersData, NoteAuto.getImagesSlot  
    memoAttachmentsSlot,   // proto.BuffersData, NoteAuto.getAttachmentsSlot  
    memoNote,   // bluecc.note.NoteProto, NoteAuto.getNote  
    memoLastContent,   // google.protobuf.StringValue, WhiteBoard.getLastContent  
    memoLastAuthor,   // google.protobuf.StringValue, WhiteBoard.getLastAuthor  
    memoContentAndAuthor,   // domain.ContentAndAuthor, WhiteBoard.getContentAndAuthor    
    // note: enum values for list query ----->

    // note: enum values for list muts ------>    
    // memo: enum values for list query ----->

    // memo: enum values for list muts ------>           

}




