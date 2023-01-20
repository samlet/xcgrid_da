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
  final StructData noteAvailablePersistSlots;
  final BuffersData noteAttachments;
  final String noteTitle;
  final String noteContent;
  final String noteAuthor;
  
  // Fields for memo
  final BuffersData memoClob;
  final BuffersData memoImages;
  final StructData memoAvailablePersistSlots;
  final BuffersData memoAttachments;
  final String memoLastContent;
  final String memoLastAuthor;
  final String memoContent;
  final String memoAuthor;
  

  PosterState({
    this.status = PosterStatus.initial,
    BuffersData? noteClob,
    BuffersData? noteImages,
    StructData? noteAvailablePersistSlots,
    BuffersData? noteAttachments,
    this.noteTitle = '',
    this.noteContent = '',
    this.noteAuthor = '',   
    
    BuffersData? memoClob,
    BuffersData? memoImages,
    StructData? memoAvailablePersistSlots,
    BuffersData? memoAttachments,
    this.memoLastContent = '',
    this.memoLastAuthor = '',
    this.memoContent = '',
    this.memoAuthor = '',   
    
    PosterPresetKeys? presetKeys
  }):
      noteClob = noteClob??BuffersData.getDefault(),
      noteImages = noteImages??BuffersData.getDefault(),
      noteAvailablePersistSlots = noteAvailablePersistSlots??StructData.getDefault(),
      noteAttachments = noteAttachments??BuffersData.getDefault(),   
      
      memoClob = memoClob??BuffersData.getDefault(),
      memoImages = memoImages??BuffersData.getDefault(),
      memoAvailablePersistSlots = memoAvailablePersistSlots??StructData.getDefault(),
      memoAttachments = memoAttachments??BuffersData.getDefault(),   
      
      presetKeys=presetKeys??PosterPresetKeys.empty;

  PosterState copyWith({ PosterStatus? status, 
    PosterPresetKeys? presetKeys,
    SlotsWrapper? slots}) {
    BuffersData? noteClob;
    BuffersData? noteImages;
    StructData? noteAvailablePersistSlots;
    BuffersData? noteAttachments;
    String? noteTitle;
    String? noteContent;
    String? noteAuthor;
    
    BuffersData? memoClob;
    BuffersData? memoImages;
    StructData? memoAvailablePersistSlots;
    BuffersData? memoAttachments;
    String? memoLastContent;
    String? memoLastAuthor;
    String? memoContent;
    String? memoAuthor;
    

    // From complicated fields
      
    BuffersMap? notePersistSlots = slots?.asProto(
        PosterDomainDefs.notePersistSlots.index, BuffersMap.fromBuffer);    
    if (notePersistSlots != null) {
      
      noteImages = notePersistSlots.values['images'];
      noteClob = notePersistSlots.values['clob'];
      noteAttachments = notePersistSlots.values['attachments'];  
         
    }
      
    NoteProto? noteDefaultDomain = slots?.asProto(
        PosterDomainDefs.noteDefaultDomain.index, NoteProto.fromBuffer);    
    if (noteDefaultDomain != null) {
      
      noteTitle = noteDefaultDomain.title;
      noteContent = noteDefaultDomain.content;
      noteAuthor = noteDefaultDomain.author;
         
    }
        
    
      
    BuffersMap? memoPersistSlots = slots?.asProto(
        PosterDomainDefs.memoPersistSlots.index, BuffersMap.fromBuffer);    
    if (memoPersistSlots != null) {
      
      memoImages = memoPersistSlots.values['images'];
      memoClob = memoPersistSlots.values['clob'];
      memoAttachments = memoPersistSlots.values['attachments'];  
         
    }
      
    ContentAndAuthor? memoContentAndAuthor = slots?.asProto(
        PosterDomainDefs.memoContentAndAuthor.index, ContentAndAuthor.fromBuffer);    
    if (memoContentAndAuthor != null) {
      
      memoContent = memoContentAndAuthor.content;
      memoLastAuthor = memoContentAndAuthor.lastAuthor;
      memoLastContent = memoContentAndAuthor.lastContent;
      memoAuthor = memoContentAndAuthor.author;
         
    }
        
        

    // From scalars  
    noteClob = slots?.asBuffers(PosterDomainDefs.noteClob.index) ?? noteClob;  
    noteImages = slots?.asBuffers(PosterDomainDefs.noteImages.index) ?? noteImages;  
    noteAvailablePersistSlots = slots?.asStruct(PosterDomainDefs.noteAvailablePersistSlots.index) ?? noteAvailablePersistSlots;  
    noteAttachments = slots?.asBuffers(PosterDomainDefs.noteAttachments.index) ?? noteAttachments;  
    noteTitle = slots?.asString(PosterDomainDefs.noteTitle.index) ?? noteTitle;  
    noteContent = slots?.asString(PosterDomainDefs.noteContent.index) ?? noteContent;  
    memoClob = slots?.asBuffers(PosterDomainDefs.memoClob.index) ?? memoClob;  
    memoImages = slots?.asBuffers(PosterDomainDefs.memoImages.index) ?? memoImages;  
    memoAvailablePersistSlots = slots?.asStruct(PosterDomainDefs.memoAvailablePersistSlots.index) ?? memoAvailablePersistSlots;  
    memoAttachments = slots?.asBuffers(PosterDomainDefs.memoAttachments.index) ?? memoAttachments;  
    memoLastContent = slots?.asString(PosterDomainDefs.memoLastContent.index) ?? memoLastContent;  
    memoLastAuthor = slots?.asString(PosterDomainDefs.memoLastAuthor.index) ?? memoLastAuthor;

    return PosterState(
      status: status ?? this.status,
      presetKeys: presetKeys ?? this.presetKeys,
      noteClob: noteClob ?? this.noteClob,
      noteImages: noteImages ?? this.noteImages,
      noteAvailablePersistSlots: noteAvailablePersistSlots ?? this.noteAvailablePersistSlots,
      noteAttachments: noteAttachments ?? this.noteAttachments,
      noteTitle: noteTitle ?? this.noteTitle,
      noteContent: noteContent ?? this.noteContent,
      noteAuthor: noteAuthor ?? this.noteAuthor,
      
      memoClob: memoClob ?? this.memoClob,
      memoImages: memoImages ?? this.memoImages,
      memoAvailablePersistSlots: memoAvailablePersistSlots ?? this.memoAvailablePersistSlots,
      memoAttachments: memoAttachments ?? this.memoAttachments,
      memoLastContent: memoLastContent ?? this.memoLastContent,
      memoLastAuthor: memoLastAuthor ?? this.memoLastAuthor,
      memoContent: memoContent ?? this.memoContent,
      memoAuthor: memoAuthor ?? this.memoAuthor,
      
    );
  }

  @override
  List<Object?> get props => [        
        status, 
        presetKeys,
        noteClob,
        noteImages,
        noteAvailablePersistSlots,
        noteAttachments,
        noteTitle,
        noteContent,
        noteAuthor,
        memoClob,
        memoImages,
        memoAvailablePersistSlots,
        memoAttachments,
        memoLastContent,
        memoLastAuthor,
        memoContent,
        memoAuthor,
      ];
}


