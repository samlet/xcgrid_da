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
}

enum DummyDomainDefs {
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
    // memo: [NoteAuto, NoteCo]
    memoClob,   // proto.BuffersData, NoteAuto.getClob
    memoImages,   // proto.BuffersData, NoteAuto.getImages
    memoAttachments,   // proto.BuffersData, NoteAuto.getAttachments
    memoAvailablePersistSlots,   // proto.StructData, NoteAuto.persistSlotsExistent
    memoPersistSlots,   // proto.BuffersMap, NoteAuto.persistSlotValues
    memoTitle,   // google.protobuf.StringValue, NoteCo.name
    memoContent,   // google.protobuf.StringValue, NoteCo.getContent
    memoDefaultDomain,   // domain.NoteProto, NoteCo.getNoteProto
}



