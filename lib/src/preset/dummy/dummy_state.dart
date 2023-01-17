part of 'dummy.dart';

enum DummyStatus { initial, loading, success, failure }
extension DummyStatusX on DummyStatus {
  bool get isInitial => this == DummyStatus.initial;
  bool get isLoading => this == DummyStatus.loading;
  bool get isSuccess => this == DummyStatus.success;
  bool get isFailure => this == DummyStatus.failure;
}

class DummyState extends Equatable {
  final DummyStatus status;
  final DummyPresetKeys presetKeys;
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
  final String memoTitle;
  final String memoContent;
  final String memoAuthor;
  
  // Fields for todos
  final int todosPercentComplete;
  final String todosDescription;
  final String todosName;
  final String todosTypeId;
  final String todosId;
  final DateTime todosLastStatusUpdate;
  final String todosStatus;
  

  DummyState({
    this.status = DummyStatus.initial,
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
    this.memoTitle = '',
    this.memoContent = '',
    this.memoAuthor = '',   
    
    this.todosPercentComplete = 0,
    this.todosDescription = '',
    this.todosName = '',
    this.todosTypeId = '',
    this.todosId = '',
    DateTime? todosLastStatusUpdate,
    this.todosStatus = '',   
    
    DummyPresetKeys? presetKeys
  }):
      noteClob = noteClob??BuffersData.getDefault(),
      noteImages = noteImages??BuffersData.getDefault(),
      noteAttachments = noteAttachments??BuffersData.getDefault(),
      noteAvailablePersistSlots = noteAvailablePersistSlots??StructData.getDefault(),   
      
      memoClob = memoClob??BuffersData.getDefault(),
      memoImages = memoImages??BuffersData.getDefault(),
      memoAttachments = memoAttachments??BuffersData.getDefault(),
      memoAvailablePersistSlots = memoAvailablePersistSlots??StructData.getDefault(),   
      
      todosLastStatusUpdate = todosLastStatusUpdate??DateTime(0),   
      
      presetKeys=presetKeys??DummyPresetKeys.empty;

  DummyState copyWith({ DummyStatus? status, 
    DummyPresetKeys? presetKeys,
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
    String? memoTitle;
    String? memoContent;
    String? memoAuthor;
    
    int? todosPercentComplete;
    String? todosDescription;
    String? todosName;
    String? todosTypeId;
    String? todosId;
    DateTime? todosLastStatusUpdate;
    String? todosStatus;
    

    // From complicated fields
      
    BuffersMap? notePersistSlots = slots?.asProto(
        DummyDomainDefs.notePersistSlots.index, BuffersMap.fromBuffer);    
    if (notePersistSlots != null) {
      
      noteAttachments = notePersistSlots.values['attachments'];
      noteClob = notePersistSlots.values['clob'];
      noteImages = notePersistSlots.values['images'];  
         
    }
      
    NoteProto? noteDefaultDomain = slots?.asProto(
        DummyDomainDefs.noteDefaultDomain.index, NoteProto.fromBuffer);    
    if (noteDefaultDomain != null) {
      
      noteAuthor = noteDefaultDomain.author;
      noteTitle = noteDefaultDomain.title;
      noteContent = noteDefaultDomain.content;
         
    }
        
    
      
    BuffersMap? memoPersistSlots = slots?.asProto(
        DummyDomainDefs.memoPersistSlots.index, BuffersMap.fromBuffer);    
    if (memoPersistSlots != null) {
      
      memoAttachments = memoPersistSlots.values['attachments'];
      memoClob = memoPersistSlots.values['clob'];
      memoImages = memoPersistSlots.values['images'];  
         
    }
      
    NoteProto? memoDefaultDomain = slots?.asProto(
        DummyDomainDefs.memoDefaultDomain.index, NoteProto.fromBuffer);    
    if (memoDefaultDomain != null) {
      
      memoAuthor = memoDefaultDomain.author;
      memoTitle = memoDefaultDomain.title;
      memoContent = memoDefaultDomain.content;
         
    }
        
    
      
    TodosProto? todosDefaultDomain = slots?.asProto(
        DummyDomainDefs.todosDefaultDomain.index, TodosProto.fromBuffer);    
    if (todosDefaultDomain != null) {
      
      todosPercentComplete = todosDefaultDomain.percentComplete.toInt();
      todosDescription = todosDefaultDomain.description;
      todosName = todosDefaultDomain.name;
      todosTypeId = todosDefaultDomain.typeId;
      todosId = todosDefaultDomain.id;
      todosLastStatusUpdate = todosDefaultDomain.lastStatusUpdate.dt;
      todosStatus = todosDefaultDomain.status;
         
    }
        
        

    // From scalars  
    noteClob = slots?.asBuffers(DummyDomainDefs.noteClob.index) ?? noteClob;  
    noteImages = slots?.asBuffers(DummyDomainDefs.noteImages.index) ?? noteImages;  
    noteAttachments = slots?.asBuffers(DummyDomainDefs.noteAttachments.index) ?? noteAttachments;  
    noteAvailablePersistSlots = slots?.asStruct(DummyDomainDefs.noteAvailablePersistSlots.index) ?? noteAvailablePersistSlots;  
    noteTitle = slots?.asString(DummyDomainDefs.noteTitle.index) ?? noteTitle;  
    noteContent = slots?.asString(DummyDomainDefs.noteContent.index) ?? noteContent;  
    memoClob = slots?.asBuffers(DummyDomainDefs.memoClob.index) ?? memoClob;  
    memoImages = slots?.asBuffers(DummyDomainDefs.memoImages.index) ?? memoImages;  
    memoAttachments = slots?.asBuffers(DummyDomainDefs.memoAttachments.index) ?? memoAttachments;  
    memoAvailablePersistSlots = slots?.asStruct(DummyDomainDefs.memoAvailablePersistSlots.index) ?? memoAvailablePersistSlots;  
    memoTitle = slots?.asString(DummyDomainDefs.memoTitle.index) ?? memoTitle;  
    memoContent = slots?.asString(DummyDomainDefs.memoContent.index) ?? memoContent;  
    todosPercentComplete = slots?.asLong(DummyDomainDefs.todosPercentComplete.index) ?? todosPercentComplete;

    return DummyState(
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
      memoTitle: memoTitle ?? this.memoTitle,
      memoContent: memoContent ?? this.memoContent,
      memoAuthor: memoAuthor ?? this.memoAuthor,
      
      todosPercentComplete: todosPercentComplete ?? this.todosPercentComplete,
      todosDescription: todosDescription ?? this.todosDescription,
      todosName: todosName ?? this.todosName,
      todosTypeId: todosTypeId ?? this.todosTypeId,
      todosId: todosId ?? this.todosId,
      todosLastStatusUpdate: todosLastStatusUpdate ?? this.todosLastStatusUpdate,
      todosStatus: todosStatus ?? this.todosStatus,
      
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
        memoTitle,
        memoContent,
        memoAuthor,
        todosPercentComplete,
        todosDescription,
        todosName,
        todosTypeId,
        todosId,
        todosLastStatusUpdate,
        todosStatus,
      ];
}


