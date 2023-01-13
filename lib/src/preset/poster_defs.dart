enum PosterMethodDefs {
    noname, // 0
    noteGetContent,    // NoteCo.getContent
    noteGetNoteProto,    // NoteCo.getNoteProto
    noteName,    // NoteCo.name
    notePersistSlotValues,    // NoteAuto.persistSlotValues
    notePersistSlotsExistent,    // NoteAuto.persistSlotsExistent
    noteRevokeContent,    // NoteCo.revokeContent
    noteSetContentComp,    // NoteCo.setContentComp
    noteUpdateNote,    // NoteAuto.updateNote
    noteUpdateNoteContent,    // NoteAuto.updateNoteContent
    memoGetContentAndAuthor,    // WhiteBoard.getContentAndAuthor
    memoGetLastAuthor,    // WhiteBoard.getLastAuthor
    memoGetLastContent,    // WhiteBoard.getLastContent
    memoPersistSlotValues,    // NoteAuto.persistSlotValues
    memoPersistSlotsExistent,    // NoteAuto.persistSlotsExistent
    memoPutContent,    // WhiteBoard.putContent
    memoUpdateNote,    // NoteAuto.updateNote
    memoUpdateNoteContent,    // NoteAuto.updateNoteContent
}

enum PosterDomainDefs {
    nonDomainField, // 0
    // note: [NoteAuto, NoteCo]
    noteAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent
    notePersistSlots,   // proto.BytesMap, NoteAuto.persistSlotValues
    noteTitle,   // google.protobuf.StringValue, NoteCo.name
    noteContent,   // google.protobuf.StringValue, NoteCo.getContent
    noteDefaultDomain,   // domain.NoteProto, NoteCo.getNoteProto
    // memo: [NoteAuto, WhiteBoard]
    memoAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent
    memoPersistSlots,   // proto.BytesMap, NoteAuto.persistSlotValues
    memoLastContent,   // google.protobuf.StringValue, WhiteBoard.getLastContent
    memoLastAuthor,   // google.protobuf.StringValue, WhiteBoard.getLastAuthor
    memoContentAndAuthor,   // domain.ContentAndAuthor, WhiteBoard.getContentAndAuthor
}



