enum DummyMethodDefs {
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
    memoGetContent,    // NoteCo.getContent
    memoGetNoteProto,    // NoteCo.getNoteProto
    memoName,    // NoteCo.name
    memoPersistSlotValues,    // NoteAuto.persistSlotValues
    memoPersistSlotsExistent,    // NoteAuto.persistSlotsExistent
    memoRevokeContent,    // NoteCo.revokeContent
    memoSetContentComp,    // NoteCo.setContentComp
    memoUpdateNote,    // NoteAuto.updateNote
    memoUpdateNoteContent,    // NoteAuto.updateNoteContent
}

enum DummyDomainDefs {
    nonDomainField, // 0
    // note: [NoteAuto, NoteCo]
    noteAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent
    notePersistSlots,   // proto.BytesMap, NoteAuto.persistSlotValues
    noteTitle,   // google.protobuf.StringValue, NoteCo.name
    noteContent,   // google.protobuf.StringValue, NoteCo.getContent
    noteDefaultDomain,   // domain.NoteProto, NoteCo.getNoteProto
    // memo: [NoteAuto, NoteCo]
    memoAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent
    memoPersistSlots,   // proto.BytesMap, NoteAuto.persistSlotValues
    memoTitle,   // google.protobuf.StringValue, NoteCo.name
    memoContent,   // google.protobuf.StringValue, NoteCo.getContent
    memoDefaultDomain,   // domain.NoteProto, NoteCo.getNoteProto
}



