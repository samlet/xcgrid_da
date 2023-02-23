part of 'poster.dart';

enum PosterStatus { initial, loading, success, failure }
extension PosterStatusX on PosterStatus {
  bool get isInitial => this == PosterStatus.initial;
  bool get isLoading => this == PosterStatus.loading;
  bool get isSuccess => this == PosterStatus.success;
  bool get isFailure => this == PosterStatus.failure;
}

class PosterState extends Equatable {
  final PosterStatus status;
  final PosterPresetKeys presetKeys;
  // Fields for note   
  final String noteAuthor;   
  final String noteTitle;   
  final DateTime noteNoteDateTime;   
  final String noteContent;   
  final String noteMoreInfoItemName;   
  final String noteNoteId;   
  final String noteMoreInfoItemId;   
  final String noteMoreInfoUrl;   
  final StructData noteAvailablePersistSlots;   
  final BuffersData noteClob;   
  final BuffersData noteImages;   
  final BuffersData noteAttachments;   
  final BuffersData noteClobSlot;   
  final BuffersData noteImagesSlot;   
  final BuffersData noteAttachmentsSlot;
  
  // Fields for memo   
  final String memoAuthor;   
  final String memoTitle;   
  final DateTime memoNoteDateTime;   
  final String memoContent;   
  final String memoMoreInfoItemName;   
  final String memoNoteId;   
  final String memoMoreInfoItemId;   
  final String memoMoreInfoUrl;   
  final StructData memoAvailablePersistSlots;   
  final BuffersData memoClob;   
  final BuffersData memoImages;   
  final BuffersData memoAttachments;   
  final BuffersData memoClobSlot;   
  final BuffersData memoImagesSlot;   
  final BuffersData memoAttachmentsSlot;   
  final String memoLastContent;   
  final String memoLastAuthor;
  

  PosterState({
    this.status = PosterStatus.initial,
    this.noteAuthor = '',
    this.noteTitle = '',
    DateTime? noteNoteDateTime,
    this.noteContent = '',
    this.noteMoreInfoItemName = '',
    this.noteNoteId = '',
    this.noteMoreInfoItemId = '',
    this.noteMoreInfoUrl = '',
    StructData? noteAvailablePersistSlots,
    BuffersData? noteClob,
    BuffersData? noteImages,
    BuffersData? noteAttachments,
    BuffersData? noteClobSlot,
    BuffersData? noteImagesSlot,
    BuffersData? noteAttachmentsSlot,   
    
    this.memoAuthor = '',
    this.memoTitle = '',
    DateTime? memoNoteDateTime,
    this.memoContent = '',
    this.memoMoreInfoItemName = '',
    this.memoNoteId = '',
    this.memoMoreInfoItemId = '',
    this.memoMoreInfoUrl = '',
    StructData? memoAvailablePersistSlots,
    BuffersData? memoClob,
    BuffersData? memoImages,
    BuffersData? memoAttachments,
    BuffersData? memoClobSlot,
    BuffersData? memoImagesSlot,
    BuffersData? memoAttachmentsSlot,
    this.memoLastContent = '',
    this.memoLastAuthor = '',   
    
    PosterPresetKeys? presetKeys
  }):
      noteNoteDateTime = noteNoteDateTime??DateTime(0),
      noteAvailablePersistSlots = noteAvailablePersistSlots??StructData.getDefault(),
      noteClob = noteClob??BuffersData.getDefault(),
      noteImages = noteImages??BuffersData.getDefault(),
      noteAttachments = noteAttachments??BuffersData.getDefault(),
      noteClobSlot = noteClobSlot??BuffersData.getDefault(),
      noteImagesSlot = noteImagesSlot??BuffersData.getDefault(),
      noteAttachmentsSlot = noteAttachmentsSlot??BuffersData.getDefault(),   
      
      memoNoteDateTime = memoNoteDateTime??DateTime(0),
      memoAvailablePersistSlots = memoAvailablePersistSlots??StructData.getDefault(),
      memoClob = memoClob??BuffersData.getDefault(),
      memoImages = memoImages??BuffersData.getDefault(),
      memoAttachments = memoAttachments??BuffersData.getDefault(),
      memoClobSlot = memoClobSlot??BuffersData.getDefault(),
      memoImagesSlot = memoImagesSlot??BuffersData.getDefault(),
      memoAttachmentsSlot = memoAttachmentsSlot??BuffersData.getDefault(),   
      
      presetKeys=presetKeys??PosterPresetKeys.empty;

  PosterState copyWith({ PosterStatus? status, 
    PosterPresetKeys? presetKeys,
    SlotsWrapper? slots}) {
    String? noteAuthor;
    String? noteTitle;
    DateTime? noteNoteDateTime;
    String? noteContent;
    String? noteMoreInfoItemName;
    String? noteNoteId;
    String? noteMoreInfoItemId;
    String? noteMoreInfoUrl;
    StructData? noteAvailablePersistSlots;
    BuffersData? noteClob;
    BuffersData? noteImages;
    BuffersData? noteAttachments;
    BuffersData? noteClobSlot;
    BuffersData? noteImagesSlot;
    BuffersData? noteAttachmentsSlot;
    
    String? memoAuthor;
    String? memoTitle;
    DateTime? memoNoteDateTime;
    String? memoContent;
    String? memoMoreInfoItemName;
    String? memoNoteId;
    String? memoMoreInfoItemId;
    String? memoMoreInfoUrl;
    StructData? memoAvailablePersistSlots;
    BuffersData? memoClob;
    BuffersData? memoImages;
    BuffersData? memoAttachments;
    BuffersData? memoClobSlot;
    BuffersData? memoImagesSlot;
    BuffersData? memoAttachmentsSlot;
    String? memoLastContent;
    String? memoLastAuthor;
    

    // From complicated fields  
      
    NoteProto? noteNote = slots?.asProto(
        PosterDomainDefs.noteNote.index, NoteProto.fromBuffer);    
    if (noteNote != null) {
      
      noteAuthor = noteNote.author;
      noteTitle = noteNote.title;
      noteNoteDateTime = noteNote.noteDateTime.dt;
      noteContent = noteNote.content;
      noteMoreInfoItemName = noteNote.moreInfoItemName;
      noteNoteId = noteNote.noteId;
      noteMoreInfoItemId = noteNote.moreInfoItemId;
      noteMoreInfoUrl = noteNote.moreInfoUrl;
         
    }
      
    BuffersMap? notePersistSlots = slots?.asProto(
        PosterDomainDefs.notePersistSlots.index, BuffersMap.fromBuffer);    
    if (notePersistSlots != null) {
      
      noteClob = notePersistSlots.values['clob'];
      noteImages = notePersistSlots.values['images'];
      noteAttachments = notePersistSlots.values['attachments'];  
         
    }
      
    NoteProto? noteDefaultDomain = slots?.asProto(
        PosterDomainDefs.noteDefaultDomain.index, NoteProto.fromBuffer);    
    if (noteDefaultDomain != null) {
      
      noteAuthor = noteDefaultDomain.author;
      noteTitle = noteDefaultDomain.title;
      noteNoteDateTime = noteDefaultDomain.noteDateTime.dt;
      noteContent = noteDefaultDomain.content;
      noteMoreInfoItemName = noteDefaultDomain.moreInfoItemName;
      noteNoteId = noteDefaultDomain.noteId;
      noteMoreInfoItemId = noteDefaultDomain.moreInfoItemId;
      noteMoreInfoUrl = noteDefaultDomain.moreInfoUrl;
         
    }
        
      
      
    NoteProto? memoNote = slots?.asProto(
        PosterDomainDefs.memoNote.index, NoteProto.fromBuffer);    
    if (memoNote != null) {
      
      memoAuthor = memoNote.author;
      memoTitle = memoNote.title;
      memoNoteDateTime = memoNote.noteDateTime.dt;
      memoContent = memoNote.content;
      memoMoreInfoItemName = memoNote.moreInfoItemName;
      memoNoteId = memoNote.noteId;
      memoMoreInfoItemId = memoNote.moreInfoItemId;
      memoMoreInfoUrl = memoNote.moreInfoUrl;
         
    }
      
    BuffersMap? memoPersistSlots = slots?.asProto(
        PosterDomainDefs.memoPersistSlots.index, BuffersMap.fromBuffer);    
    if (memoPersistSlots != null) {
      
      memoClob = memoPersistSlots.values['clob'];
      memoImages = memoPersistSlots.values['images'];
      memoAttachments = memoPersistSlots.values['attachments'];  
         
    }
      
    ContentAndAuthor? memoContentAndAuthor = slots?.asProto(
        PosterDomainDefs.memoContentAndAuthor.index, ContentAndAuthor.fromBuffer);    
    if (memoContentAndAuthor != null) {
      
      memoAuthor = memoContentAndAuthor.author;
      memoLastContent = memoContentAndAuthor.lastContent;
      memoLastAuthor = memoContentAndAuthor.lastAuthor;
      memoContent = memoContentAndAuthor.content;
         
    }
        
        

    // From scalars  
    noteAvailablePersistSlots = slots?.asStruct(PosterDomainDefs.noteAvailablePersistSlots.index) ?? noteAvailablePersistSlots;  
    noteClobSlot = slots?.asBuffers(PosterDomainDefs.noteClobSlot.index) ?? noteClobSlot;  
    noteImagesSlot = slots?.asBuffers(PosterDomainDefs.noteImagesSlot.index) ?? noteImagesSlot;  
    noteAttachmentsSlot = slots?.asBuffers(PosterDomainDefs.noteAttachmentsSlot.index) ?? noteAttachmentsSlot;  
    noteTitle = slots?.asString(PosterDomainDefs.noteTitle.index) ?? noteTitle;  
    noteContent = slots?.asString(PosterDomainDefs.noteContent.index) ?? noteContent;  
    memoAvailablePersistSlots = slots?.asStruct(PosterDomainDefs.memoAvailablePersistSlots.index) ?? memoAvailablePersistSlots;  
    memoClobSlot = slots?.asBuffers(PosterDomainDefs.memoClobSlot.index) ?? memoClobSlot;  
    memoImagesSlot = slots?.asBuffers(PosterDomainDefs.memoImagesSlot.index) ?? memoImagesSlot;  
    memoAttachmentsSlot = slots?.asBuffers(PosterDomainDefs.memoAttachmentsSlot.index) ?? memoAttachmentsSlot;  
    memoLastContent = slots?.asString(PosterDomainDefs.memoLastContent.index) ?? memoLastContent;  
    memoLastAuthor = slots?.asString(PosterDomainDefs.memoLastAuthor.index) ?? memoLastAuthor;

    return PosterState(
      status: status ?? this.status,
      presetKeys: presetKeys ?? this.presetKeys,
      noteAuthor: noteAuthor ?? this.noteAuthor,
      noteTitle: noteTitle ?? this.noteTitle,
      noteNoteDateTime: noteNoteDateTime ?? this.noteNoteDateTime,
      noteContent: noteContent ?? this.noteContent,
      noteMoreInfoItemName: noteMoreInfoItemName ?? this.noteMoreInfoItemName,
      noteNoteId: noteNoteId ?? this.noteNoteId,
      noteMoreInfoItemId: noteMoreInfoItemId ?? this.noteMoreInfoItemId,
      noteMoreInfoUrl: noteMoreInfoUrl ?? this.noteMoreInfoUrl,
      noteAvailablePersistSlots: noteAvailablePersistSlots ?? this.noteAvailablePersistSlots,
      noteClob: noteClob ?? this.noteClob,
      noteImages: noteImages ?? this.noteImages,
      noteAttachments: noteAttachments ?? this.noteAttachments,
      noteClobSlot: noteClobSlot ?? this.noteClobSlot,
      noteImagesSlot: noteImagesSlot ?? this.noteImagesSlot,
      noteAttachmentsSlot: noteAttachmentsSlot ?? this.noteAttachmentsSlot,
      
      memoAuthor: memoAuthor ?? this.memoAuthor,
      memoTitle: memoTitle ?? this.memoTitle,
      memoNoteDateTime: memoNoteDateTime ?? this.memoNoteDateTime,
      memoContent: memoContent ?? this.memoContent,
      memoMoreInfoItemName: memoMoreInfoItemName ?? this.memoMoreInfoItemName,
      memoNoteId: memoNoteId ?? this.memoNoteId,
      memoMoreInfoItemId: memoMoreInfoItemId ?? this.memoMoreInfoItemId,
      memoMoreInfoUrl: memoMoreInfoUrl ?? this.memoMoreInfoUrl,
      memoAvailablePersistSlots: memoAvailablePersistSlots ?? this.memoAvailablePersistSlots,
      memoClob: memoClob ?? this.memoClob,
      memoImages: memoImages ?? this.memoImages,
      memoAttachments: memoAttachments ?? this.memoAttachments,
      memoClobSlot: memoClobSlot ?? this.memoClobSlot,
      memoImagesSlot: memoImagesSlot ?? this.memoImagesSlot,
      memoAttachmentsSlot: memoAttachmentsSlot ?? this.memoAttachmentsSlot,
      memoLastContent: memoLastContent ?? this.memoLastContent,
      memoLastAuthor: memoLastAuthor ?? this.memoLastAuthor,
      
    );
  }

  @override
  List<Object?> get props => [        
        status, 
        presetKeys,
        noteAuthor,
        noteTitle,
        noteNoteDateTime,
        noteContent,
        noteMoreInfoItemName,
        noteNoteId,
        noteMoreInfoItemId,
        noteMoreInfoUrl,
        noteAvailablePersistSlots,
        noteClob,
        noteImages,
        noteAttachments,
        noteClobSlot,
        noteImagesSlot,
        noteAttachmentsSlot,
        memoAuthor,
        memoTitle,
        memoNoteDateTime,
        memoContent,
        memoMoreInfoItemName,
        memoNoteId,
        memoMoreInfoItemId,
        memoMoreInfoUrl,
        memoAvailablePersistSlots,
        memoClob,
        memoImages,
        memoAttachments,
        memoClobSlot,
        memoImagesSlot,
        memoAttachmentsSlot,
        memoLastContent,
        memoLastAuthor,
      ];
}


