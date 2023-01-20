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
  final String memoTitle;
  final String memoContent;
  final String memoAuthor;
  
  // Fields for todos
  final int todosPercentComplete;
  final String todosTypeId;
  final String todosId;
  final DateTime todosLastStatusUpdate;
  final String todosName;
  final String todosDescription;
  final String todosStatus;
  

  DummyState({
    this.status = DummyStatus.initial,
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
    this.memoTitle = '',
    this.memoContent = '',
    this.memoAuthor = '',   
    
    this.todosPercentComplete = 0,
    this.todosTypeId = '',
    this.todosId = '',
    DateTime? todosLastStatusUpdate,
    this.todosName = '',
    this.todosDescription = '',
    this.todosStatus = '',   
    
    DummyPresetKeys? presetKeys
  }):
      noteClob = noteClob??BuffersData.getDefault(),
      noteImages = noteImages??BuffersData.getDefault(),
      noteAvailablePersistSlots = noteAvailablePersistSlots??StructData.getDefault(),
      noteAttachments = noteAttachments??BuffersData.getDefault(),   
      
      memoClob = memoClob??BuffersData.getDefault(),
      memoImages = memoImages??BuffersData.getDefault(),
      memoAvailablePersistSlots = memoAvailablePersistSlots??StructData.getDefault(),
      memoAttachments = memoAttachments??BuffersData.getDefault(),   
      
      todosLastStatusUpdate = todosLastStatusUpdate??DateTime(0),   
      
      presetKeys=presetKeys??DummyPresetKeys.empty;

  DummyState copyWith({ DummyStatus? status, 
    DummyPresetKeys? presetKeys,
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
    String? memoTitle;
    String? memoContent;
    String? memoAuthor;
    
    int? todosPercentComplete;
    String? todosTypeId;
    String? todosId;
    DateTime? todosLastStatusUpdate;
    String? todosName;
    String? todosDescription;
    String? todosStatus;
    

    // From complicated fields
      
    BuffersMap? notePersistSlots = slots?.asProto(
        DummyDomainDefs.notePersistSlots.index, BuffersMap.fromBuffer);    
    if (notePersistSlots != null) {
      
      noteImages = notePersistSlots.values['images'];
      noteClob = notePersistSlots.values['clob'];
      noteAttachments = notePersistSlots.values['attachments'];  
         
    }
      
    NoteProto? noteDefaultDomain = slots?.asProto(
        DummyDomainDefs.noteDefaultDomain.index, NoteProto.fromBuffer);    
    if (noteDefaultDomain != null) {
      
      noteTitle = noteDefaultDomain.title;
      noteContent = noteDefaultDomain.content;
      noteAuthor = noteDefaultDomain.author;
         
    }
        
    
      
    BuffersMap? memoPersistSlots = slots?.asProto(
        DummyDomainDefs.memoPersistSlots.index, BuffersMap.fromBuffer);    
    if (memoPersistSlots != null) {
      
      memoImages = memoPersistSlots.values['images'];
      memoClob = memoPersistSlots.values['clob'];
      memoAttachments = memoPersistSlots.values['attachments'];  
         
    }
      
    NoteProto? memoDefaultDomain = slots?.asProto(
        DummyDomainDefs.memoDefaultDomain.index, NoteProto.fromBuffer);    
    if (memoDefaultDomain != null) {
      
      memoTitle = memoDefaultDomain.title;
      memoContent = memoDefaultDomain.content;
      memoAuthor = memoDefaultDomain.author;
         
    }
        
    
      
    TodosProto? todosDefaultDomain = slots?.asProto(
        DummyDomainDefs.todosDefaultDomain.index, TodosProto.fromBuffer);    
    if (todosDefaultDomain != null) {
      
      todosTypeId = todosDefaultDomain.typeId;
      todosId = todosDefaultDomain.id;
      todosLastStatusUpdate = todosDefaultDomain.lastStatusUpdate.dt;
      todosPercentComplete = todosDefaultDomain.percentComplete.toInt();
      todosName = todosDefaultDomain.name;
      todosDescription = todosDefaultDomain.description;
      todosStatus = todosDefaultDomain.status;
         
    }
        
        

    // From scalars  
    noteClob = slots?.asBuffers(DummyDomainDefs.noteClob.index) ?? noteClob;  
    noteImages = slots?.asBuffers(DummyDomainDefs.noteImages.index) ?? noteImages;  
    noteAvailablePersistSlots = slots?.asStruct(DummyDomainDefs.noteAvailablePersistSlots.index) ?? noteAvailablePersistSlots;  
    noteAttachments = slots?.asBuffers(DummyDomainDefs.noteAttachments.index) ?? noteAttachments;  
    noteTitle = slots?.asString(DummyDomainDefs.noteTitle.index) ?? noteTitle;  
    noteContent = slots?.asString(DummyDomainDefs.noteContent.index) ?? noteContent;  
    memoClob = slots?.asBuffers(DummyDomainDefs.memoClob.index) ?? memoClob;  
    memoImages = slots?.asBuffers(DummyDomainDefs.memoImages.index) ?? memoImages;  
    memoAvailablePersistSlots = slots?.asStruct(DummyDomainDefs.memoAvailablePersistSlots.index) ?? memoAvailablePersistSlots;  
    memoAttachments = slots?.asBuffers(DummyDomainDefs.memoAttachments.index) ?? memoAttachments;  
    memoTitle = slots?.asString(DummyDomainDefs.memoTitle.index) ?? memoTitle;  
    memoContent = slots?.asString(DummyDomainDefs.memoContent.index) ?? memoContent;  
    todosPercentComplete = slots?.asLong(DummyDomainDefs.todosPercentComplete.index) ?? todosPercentComplete;

    return DummyState(
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
      memoTitle: memoTitle ?? this.memoTitle,
      memoContent: memoContent ?? this.memoContent,
      memoAuthor: memoAuthor ?? this.memoAuthor,
      
      todosPercentComplete: todosPercentComplete ?? this.todosPercentComplete,
      todosTypeId: todosTypeId ?? this.todosTypeId,
      todosId: todosId ?? this.todosId,
      todosLastStatusUpdate: todosLastStatusUpdate ?? this.todosLastStatusUpdate,
      todosName: todosName ?? this.todosName,
      todosDescription: todosDescription ?? this.todosDescription,
      todosStatus: todosStatus ?? this.todosStatus,
      
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
        memoTitle,
        memoContent,
        memoAuthor,
        todosPercentComplete,
        todosTypeId,
        todosId,
        todosLastStatusUpdate,
        todosName,
        todosDescription,
        todosStatus,
      ];
}


