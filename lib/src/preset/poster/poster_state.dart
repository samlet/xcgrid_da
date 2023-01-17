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
  final BuffersData noteClob;
  final BuffersData noteImages;
  final BuffersData noteAttachments;
  final StructData noteAvailablePersistSlots;
  final String noteTitle;
  final String noteContent;
  final String noteAuthor;
  
  // Fields for memo
  final BuffersData memoClob;
  final BuffersData memoImages;
  final BuffersData memoAttachments;
  final StructData memoAvailablePersistSlots;
  final String memoLastContent;
  final String memoLastAuthor;
  final String memoAuthor;
  final String memoContent;
  

  PosterState({
    this.status = PosterStatus.initial,
    BuffersData? noteClob,
    BuffersData? noteImages,
    BuffersData? noteAttachments,
    StructData? noteAvailablePersistSlots,
    this.noteTitle = '',
    this.noteContent = '',
    this.noteAuthor = '',   
    
    BuffersData? memoClob,
    BuffersData? memoImages,
    BuffersData? memoAttachments,
    StructData? memoAvailablePersistSlots,
    this.memoLastContent = '',
    this.memoLastAuthor = '',
    this.memoAuthor = '',
    this.memoContent = '',   
    
    PosterPresetKeys? presetKeys
  }):
      noteClob = noteClob??BuffersData.getDefault(),
      noteImages = noteImages??BuffersData.getDefault(),
      noteAttachments = noteAttachments??BuffersData.getDefault(),
      noteAvailablePersistSlots = noteAvailablePersistSlots??StructData.getDefault(),   
      
      memoClob = memoClob??BuffersData.getDefault(),
      memoImages = memoImages??BuffersData.getDefault(),
      memoAttachments = memoAttachments??BuffersData.getDefault(),
      memoAvailablePersistSlots = memoAvailablePersistSlots??StructData.getDefault(),   
      
      presetKeys=presetKeys??PosterPresetKeys.empty;

  PosterState copyWith({ PosterStatus? status, 
    PosterPresetKeys? presetKeys,
    SlotsWrapper? slots}) {
    BuffersData? noteClob;
    BuffersData? noteImages;
    BuffersData? noteAttachments;
    StructData? noteAvailablePersistSlots;
    String? noteTitle;
    String? noteContent;
    String? noteAuthor;
    
    BuffersData? memoClob;
    BuffersData? memoImages;
    BuffersData? memoAttachments;
    StructData? memoAvailablePersistSlots;
    String? memoLastContent;
    String? memoLastAuthor;
    String? memoAuthor;
    String? memoContent;
    

    // From complicated fields
      
    BuffersMap? notePersistSlots = slots?.asProto(
        PosterDomainDefs.notePersistSlots.index, BuffersMap.fromBuffer);    
    if (notePersistSlots != null) {
      
      noteAttachments = notePersistSlots.values['attachments'];
      noteClob = notePersistSlots.values['clob'];
      noteImages = notePersistSlots.values['images'];  
         
    }
      
    NoteProto? noteDefaultDomain = slots?.asProto(
        PosterDomainDefs.noteDefaultDomain.index, NoteProto.fromBuffer);    
    if (noteDefaultDomain != null) {
      
      noteAuthor = noteDefaultDomain.author;
      noteTitle = noteDefaultDomain.title;
      noteContent = noteDefaultDomain.content;
         
    }
        
    
      
    BuffersMap? memoPersistSlots = slots?.asProto(
        PosterDomainDefs.memoPersistSlots.index, BuffersMap.fromBuffer);    
    if (memoPersistSlots != null) {
      
      memoAttachments = memoPersistSlots.values['attachments'];
      memoClob = memoPersistSlots.values['clob'];
      memoImages = memoPersistSlots.values['images'];  
         
    }
      
    ContentAndAuthor? memoContentAndAuthor = slots?.asProto(
        PosterDomainDefs.memoContentAndAuthor.index, ContentAndAuthor.fromBuffer);    
    if (memoContentAndAuthor != null) {
      
      memoAuthor = memoContentAndAuthor.author;
      memoLastAuthor = memoContentAndAuthor.lastAuthor;
      memoLastContent = memoContentAndAuthor.lastContent;
      memoContent = memoContentAndAuthor.content;
         
    }
        
        

    // From scalars  
    noteClob = slots?.asBuffers(PosterDomainDefs.noteClob.index) ?? noteClob;  
    noteImages = slots?.asBuffers(PosterDomainDefs.noteImages.index) ?? noteImages;  
    noteAttachments = slots?.asBuffers(PosterDomainDefs.noteAttachments.index) ?? noteAttachments;  
    noteAvailablePersistSlots = slots?.asStruct(PosterDomainDefs.noteAvailablePersistSlots.index) ?? noteAvailablePersistSlots;  
    noteTitle = slots?.asString(PosterDomainDefs.noteTitle.index) ?? noteTitle;  
    noteContent = slots?.asString(PosterDomainDefs.noteContent.index) ?? noteContent;  
    memoClob = slots?.asBuffers(PosterDomainDefs.memoClob.index) ?? memoClob;  
    memoImages = slots?.asBuffers(PosterDomainDefs.memoImages.index) ?? memoImages;  
    memoAttachments = slots?.asBuffers(PosterDomainDefs.memoAttachments.index) ?? memoAttachments;  
    memoAvailablePersistSlots = slots?.asStruct(PosterDomainDefs.memoAvailablePersistSlots.index) ?? memoAvailablePersistSlots;  
    memoLastContent = slots?.asString(PosterDomainDefs.memoLastContent.index) ?? memoLastContent;  
    memoLastAuthor = slots?.asString(PosterDomainDefs.memoLastAuthor.index) ?? memoLastAuthor;

    return PosterState(
      status: status ?? this.status,
      presetKeys: presetKeys ?? this.presetKeys,
      noteClob: noteClob ?? this.noteClob,
      noteImages: noteImages ?? this.noteImages,
      noteAttachments: noteAttachments ?? this.noteAttachments,
      noteAvailablePersistSlots: noteAvailablePersistSlots ?? this.noteAvailablePersistSlots,
      noteTitle: noteTitle ?? this.noteTitle,
      noteContent: noteContent ?? this.noteContent,
      noteAuthor: noteAuthor ?? this.noteAuthor,
      
      memoClob: memoClob ?? this.memoClob,
      memoImages: memoImages ?? this.memoImages,
      memoAttachments: memoAttachments ?? this.memoAttachments,
      memoAvailablePersistSlots: memoAvailablePersistSlots ?? this.memoAvailablePersistSlots,
      memoLastContent: memoLastContent ?? this.memoLastContent,
      memoLastAuthor: memoLastAuthor ?? this.memoLastAuthor,
      memoAuthor: memoAuthor ?? this.memoAuthor,
      memoContent: memoContent ?? this.memoContent,
      
    );
  }

  @override
  List<Object?> get props => [        
        status, 
        presetKeys,
        noteClob,
        noteImages,
        noteAttachments,
        noteAvailablePersistSlots,
        noteTitle,
        noteContent,
        noteAuthor,
        memoClob,
        memoImages,
        memoAttachments,
        memoAvailablePersistSlots,
        memoLastContent,
        memoLastAuthor,
        memoAuthor,
        memoContent,
      ];
}


