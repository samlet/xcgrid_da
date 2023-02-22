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
  final StructData noteAvailablePersistSlots;   
  final BuffersData noteImages;   
  final BuffersData noteClob;   
  final BuffersData noteAttachments;   
  final BuffersData noteClobSlot;   
  final BuffersData noteImagesSlot;   
  final BuffersData noteAttachmentsSlot;   
  final String noteNoteId;   
  final String noteContent;   
  final String noteMoreInfoItemName;   
  final DateTime noteNoteDateTime;   
  final String noteMoreInfoItemId;   
  final String noteTitle;   
  final String noteAuthor;   
  final String noteMoreInfoUrl;
  
  // Fields for memo   
  final StructData memoAvailablePersistSlots;   
  final BuffersData memoImages;   
  final BuffersData memoClob;   
  final BuffersData memoAttachments;   
  final BuffersData memoClobSlot;   
  final BuffersData memoImagesSlot;   
  final BuffersData memoAttachmentsSlot;   
  final String memoNoteId;   
  final String memoContent;   
  final String memoMoreInfoItemName;   
  final DateTime memoNoteDateTime;   
  final String memoMoreInfoItemId;   
  final String memoTitle;   
  final String memoAuthor;   
  final String memoMoreInfoUrl;   
  final String memoLastContent;   
  final String memoLastAuthor;
  

  PosterState({
    this.status = PosterStatus.initial,
    StructData? noteAvailablePersistSlots,
    BuffersData? noteImages,
    BuffersData? noteClob,
    BuffersData? noteAttachments,
    BuffersData? noteClobSlot,
    BuffersData? noteImagesSlot,
    BuffersData? noteAttachmentsSlot,
    this.noteNoteId = '',
    this.noteContent = '',
    this.noteMoreInfoItemName = '',
    DateTime? noteNoteDateTime,
    this.noteMoreInfoItemId = '',
    this.noteTitle = '',
    this.noteAuthor = '',
    this.noteMoreInfoUrl = '',   
    
    StructData? memoAvailablePersistSlots,
    BuffersData? memoImages,
    BuffersData? memoClob,
    BuffersData? memoAttachments,
    BuffersData? memoClobSlot,
    BuffersData? memoImagesSlot,
    BuffersData? memoAttachmentsSlot,
    this.memoNoteId = '',
    this.memoContent = '',
    this.memoMoreInfoItemName = '',
    DateTime? memoNoteDateTime,
    this.memoMoreInfoItemId = '',
    this.memoTitle = '',
    this.memoAuthor = '',
    this.memoMoreInfoUrl = '',
    this.memoLastContent = '',
    this.memoLastAuthor = '',   
    
    PosterPresetKeys? presetKeys
  }):
      noteAvailablePersistSlots = noteAvailablePersistSlots??StructData.getDefault(),
      noteImages = noteImages??BuffersData.getDefault(),
      noteClob = noteClob??BuffersData.getDefault(),
      noteAttachments = noteAttachments??BuffersData.getDefault(),
      noteClobSlot = noteClobSlot??BuffersData.getDefault(),
      noteImagesSlot = noteImagesSlot??BuffersData.getDefault(),
      noteAttachmentsSlot = noteAttachmentsSlot??BuffersData.getDefault(),
      noteNoteDateTime = noteNoteDateTime??DateTime(0),   
      
      memoAvailablePersistSlots = memoAvailablePersistSlots??StructData.getDefault(),
      memoImages = memoImages??BuffersData.getDefault(),
      memoClob = memoClob??BuffersData.getDefault(),
      memoAttachments = memoAttachments??BuffersData.getDefault(),
      memoClobSlot = memoClobSlot??BuffersData.getDefault(),
      memoImagesSlot = memoImagesSlot??BuffersData.getDefault(),
      memoAttachmentsSlot = memoAttachmentsSlot??BuffersData.getDefault(),
      memoNoteDateTime = memoNoteDateTime??DateTime(0),   
      
      presetKeys=presetKeys??PosterPresetKeys.empty;

  PosterState copyWith({ PosterStatus? status, 
    PosterPresetKeys? presetKeys,
    SlotsWrapper? slots}) {
    StructData? noteAvailablePersistSlots;
    BuffersData? noteImages;
    BuffersData? noteClob;
    BuffersData? noteAttachments;
    BuffersData? noteClobSlot;
    BuffersData? noteImagesSlot;
    BuffersData? noteAttachmentsSlot;
    String? noteNoteId;
    String? noteContent;
    String? noteMoreInfoItemName;
    DateTime? noteNoteDateTime;
    String? noteMoreInfoItemId;
    String? noteTitle;
    String? noteAuthor;
    String? noteMoreInfoUrl;
    
    StructData? memoAvailablePersistSlots;
    BuffersData? memoImages;
    BuffersData? memoClob;
    BuffersData? memoAttachments;
    BuffersData? memoClobSlot;
    BuffersData? memoImagesSlot;
    BuffersData? memoAttachmentsSlot;
    String? memoNoteId;
    String? memoContent;
    String? memoMoreInfoItemName;
    DateTime? memoNoteDateTime;
    String? memoMoreInfoItemId;
    String? memoTitle;
    String? memoAuthor;
    String? memoMoreInfoUrl;
    String? memoLastContent;
    String? memoLastAuthor;
    

    // From complicated fields  
      
    BuffersMap? notePersistSlots = slots?.asProto(
        PosterDomainDefs.notePersistSlots.index, BuffersMap.fromBuffer);    
    if (notePersistSlots != null) {
      
      noteImages = notePersistSlots.values['images'];
      noteClob = notePersistSlots.values['clob'];
      noteAttachments = notePersistSlots.values['attachments'];  
         
    }
      
    NoteProto? noteNote = slots?.asProto(
        PosterDomainDefs.noteNote.index, NoteProto.fromBuffer);    
    if (noteNote != null) {
      
      noteNoteId = noteNote.noteId;
      noteContent = noteNote.content;
      noteMoreInfoItemName = noteNote.moreInfoItemName;
      noteNoteDateTime = noteNote.noteDateTime.dt;
      noteMoreInfoItemId = noteNote.moreInfoItemId;
      noteTitle = noteNote.title;
      noteAuthor = noteNote.author;
      noteMoreInfoUrl = noteNote.moreInfoUrl;
         
    }
      
    NoteProto? noteDefaultDomain = slots?.asProto(
        PosterDomainDefs.noteDefaultDomain.index, NoteProto.fromBuffer);    
    if (noteDefaultDomain != null) {
      
      noteNoteId = noteDefaultDomain.noteId;
      noteContent = noteDefaultDomain.content;
      noteMoreInfoItemName = noteDefaultDomain.moreInfoItemName;
      noteNoteDateTime = noteDefaultDomain.noteDateTime.dt;
      noteMoreInfoItemId = noteDefaultDomain.moreInfoItemId;
      noteTitle = noteDefaultDomain.title;
      noteAuthor = noteDefaultDomain.author;
      noteMoreInfoUrl = noteDefaultDomain.moreInfoUrl;
         
    }
        
      
      
    BuffersMap? memoPersistSlots = slots?.asProto(
        PosterDomainDefs.memoPersistSlots.index, BuffersMap.fromBuffer);    
    if (memoPersistSlots != null) {
      
      memoImages = memoPersistSlots.values['images'];
      memoClob = memoPersistSlots.values['clob'];
      memoAttachments = memoPersistSlots.values['attachments'];  
         
    }
      
    NoteProto? memoNote = slots?.asProto(
        PosterDomainDefs.memoNote.index, NoteProto.fromBuffer);    
    if (memoNote != null) {
      
      memoNoteId = memoNote.noteId;
      memoContent = memoNote.content;
      memoMoreInfoItemName = memoNote.moreInfoItemName;
      memoNoteDateTime = memoNote.noteDateTime.dt;
      memoMoreInfoItemId = memoNote.moreInfoItemId;
      memoTitle = memoNote.title;
      memoAuthor = memoNote.author;
      memoMoreInfoUrl = memoNote.moreInfoUrl;
         
    }
      
    ContentAndAuthor? memoContentAndAuthor = slots?.asProto(
        PosterDomainDefs.memoContentAndAuthor.index, ContentAndAuthor.fromBuffer);    
    if (memoContentAndAuthor != null) {
      
      memoLastContent = memoContentAndAuthor.lastContent;
      memoLastAuthor = memoContentAndAuthor.lastAuthor;
      memoContent = memoContentAndAuthor.content;
      memoAuthor = memoContentAndAuthor.author;
         
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
      noteAvailablePersistSlots: noteAvailablePersistSlots ?? this.noteAvailablePersistSlots,
      noteImages: noteImages ?? this.noteImages,
      noteClob: noteClob ?? this.noteClob,
      noteAttachments: noteAttachments ?? this.noteAttachments,
      noteClobSlot: noteClobSlot ?? this.noteClobSlot,
      noteImagesSlot: noteImagesSlot ?? this.noteImagesSlot,
      noteAttachmentsSlot: noteAttachmentsSlot ?? this.noteAttachmentsSlot,
      noteNoteId: noteNoteId ?? this.noteNoteId,
      noteContent: noteContent ?? this.noteContent,
      noteMoreInfoItemName: noteMoreInfoItemName ?? this.noteMoreInfoItemName,
      noteNoteDateTime: noteNoteDateTime ?? this.noteNoteDateTime,
      noteMoreInfoItemId: noteMoreInfoItemId ?? this.noteMoreInfoItemId,
      noteTitle: noteTitle ?? this.noteTitle,
      noteAuthor: noteAuthor ?? this.noteAuthor,
      noteMoreInfoUrl: noteMoreInfoUrl ?? this.noteMoreInfoUrl,
      
      memoAvailablePersistSlots: memoAvailablePersistSlots ?? this.memoAvailablePersistSlots,
      memoImages: memoImages ?? this.memoImages,
      memoClob: memoClob ?? this.memoClob,
      memoAttachments: memoAttachments ?? this.memoAttachments,
      memoClobSlot: memoClobSlot ?? this.memoClobSlot,
      memoImagesSlot: memoImagesSlot ?? this.memoImagesSlot,
      memoAttachmentsSlot: memoAttachmentsSlot ?? this.memoAttachmentsSlot,
      memoNoteId: memoNoteId ?? this.memoNoteId,
      memoContent: memoContent ?? this.memoContent,
      memoMoreInfoItemName: memoMoreInfoItemName ?? this.memoMoreInfoItemName,
      memoNoteDateTime: memoNoteDateTime ?? this.memoNoteDateTime,
      memoMoreInfoItemId: memoMoreInfoItemId ?? this.memoMoreInfoItemId,
      memoTitle: memoTitle ?? this.memoTitle,
      memoAuthor: memoAuthor ?? this.memoAuthor,
      memoMoreInfoUrl: memoMoreInfoUrl ?? this.memoMoreInfoUrl,
      memoLastContent: memoLastContent ?? this.memoLastContent,
      memoLastAuthor: memoLastAuthor ?? this.memoLastAuthor,
      
    );
  }

  @override
  List<Object?> get props => [        
        status, 
        presetKeys,
        noteAvailablePersistSlots,
        noteImages,
        noteClob,
        noteAttachments,
        noteClobSlot,
        noteImagesSlot,
        noteAttachmentsSlot,
        noteNoteId,
        noteContent,
        noteMoreInfoItemName,
        noteNoteDateTime,
        noteMoreInfoItemId,
        noteTitle,
        noteAuthor,
        noteMoreInfoUrl,
        memoAvailablePersistSlots,
        memoImages,
        memoClob,
        memoAttachments,
        memoClobSlot,
        memoImagesSlot,
        memoAttachmentsSlot,
        memoNoteId,
        memoContent,
        memoMoreInfoItemName,
        memoNoteDateTime,
        memoMoreInfoItemId,
        memoTitle,
        memoAuthor,
        memoMoreInfoUrl,
        memoLastContent,
        memoLastAuthor,
      ];
}


