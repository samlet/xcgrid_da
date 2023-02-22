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
  
  // Fields for todos   
  final Decimal todosQuantityToProduce;   
  final double todosTotalMilliSecondsAllowed;   
  final String todosTempExprId;   
  final String todosShowAsEnumId;   
  final String todosInfoUrl;   
  final String todosFixedAssetId;   
  final String todosUniversalId;   
  final Decimal todosReservNthPPPerc;   
  final Decimal todosReservPersons;   
  final String todosEstimateCalcMethod;   
  final String todosServiceLoaderName;   
  final String todosWorkEffortParentId;   
  final int todosPercentComplete;   
  final DateTime todosCreatedDate;   
  final int todosPriority;   
  final Decimal todosTotalMoneyAllowed;   
  final String todosScopeEnumId;   
  final String todosNoteId;   
  final String todosAccommodationMapId;   
  final String todosCreatedByUserLogin;   
  final String todosRuntimeDataId;   
  final double todosEstimatedMilliSeconds;   
  final double todosEstimatedSetupMillis;   
  final String todosSpecialTerms;   
  final String todosFacilityId;   
  final DateTime todosEstimatedStartDate;   
  final Decimal todosQuantityRejected;   
  final String todosMoneyUomId;   
  final String todosLocationDesc;   
  final int todosTimeTransparency;   
  final DateTime todosActualCompletionDate;   
  final double todosActualSetupMillis;   
  final String todosWorkEffortName;   
  final Indicator todosSendNotificationEmail;   
  final String todosCurrentStatusId;   
  final String todosSlotId;   
  final String todosWorkEffortPurposeTypeId;   
  final String todosWorkEffortId;   
  final String todosAccommodationSpotId;   
  final String todosLastModifiedByUserLogin;   
  final DateTime todosLastStatusUpdate;   
  final DateTime todosEstimatedCompletionDate;   
  final Decimal todosReserv2ndPPPerc;   
  final String todosDescription;   
  final Indicator todosConfirmation;   
  final DateTime todosLastModifiedDate;   
  final String todosWorkEffortTypeId;   
  final int todosRevisionNumber;   
  final DateTime todosActualStartDate;   
  final String todosSourceReferenceId;   
  final int todosSequenceNum;   
  final double todosActualMilliSeconds;   
  final String todosRecurrenceInfoId;   
  final Decimal todosQuantityProduced;   
  final String todosName;   
  final String todosTypeId;   
  final String todosId;   
  final String todosStatus;
  

  DummyState({
    this.status = DummyStatus.initial,
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
    
    Decimal? todosQuantityToProduce,
    this.todosTotalMilliSecondsAllowed = 0.0,
    this.todosTempExprId = '',
    this.todosShowAsEnumId = '',
    this.todosInfoUrl = '',
    this.todosFixedAssetId = '',
    this.todosUniversalId = '',
    Decimal? todosReservNthPPPerc,
    Decimal? todosReservPersons,
    this.todosEstimateCalcMethod = '',
    this.todosServiceLoaderName = '',
    this.todosWorkEffortParentId = '',
    this.todosPercentComplete = 0,
    DateTime? todosCreatedDate,
    this.todosPriority = 0,
    Decimal? todosTotalMoneyAllowed,
    this.todosScopeEnumId = '',
    this.todosNoteId = '',
    this.todosAccommodationMapId = '',
    this.todosCreatedByUserLogin = '',
    this.todosRuntimeDataId = '',
    this.todosEstimatedMilliSeconds = 0.0,
    this.todosEstimatedSetupMillis = 0.0,
    this.todosSpecialTerms = '',
    this.todosFacilityId = '',
    DateTime? todosEstimatedStartDate,
    Decimal? todosQuantityRejected,
    this.todosMoneyUomId = '',
    this.todosLocationDesc = '',
    this.todosTimeTransparency = 0,
    DateTime? todosActualCompletionDate,
    this.todosActualSetupMillis = 0.0,
    this.todosWorkEffortName = '',
    this.todosSendNotificationEmail = Indicator.NO,
    this.todosCurrentStatusId = '',
    this.todosSlotId = '',
    this.todosWorkEffortPurposeTypeId = '',
    this.todosWorkEffortId = '',
    this.todosAccommodationSpotId = '',
    this.todosLastModifiedByUserLogin = '',
    DateTime? todosLastStatusUpdate,
    DateTime? todosEstimatedCompletionDate,
    Decimal? todosReserv2ndPPPerc,
    this.todosDescription = '',
    this.todosConfirmation = Indicator.NO,
    DateTime? todosLastModifiedDate,
    this.todosWorkEffortTypeId = '',
    this.todosRevisionNumber = 0,
    DateTime? todosActualStartDate,
    this.todosSourceReferenceId = '',
    this.todosSequenceNum = 0,
    this.todosActualMilliSeconds = 0.0,
    this.todosRecurrenceInfoId = '',
    Decimal? todosQuantityProduced,
    this.todosName = '',
    this.todosTypeId = '',
    this.todosId = '',
    this.todosStatus = '',   
    
    DummyPresetKeys? presetKeys
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
      
      todosQuantityToProduce = todosQuantityToProduce??Decimal.zero,
      todosReservNthPPPerc = todosReservNthPPPerc??Decimal.zero,
      todosReservPersons = todosReservPersons??Decimal.zero,
      todosCreatedDate = todosCreatedDate??DateTime(0),
      todosTotalMoneyAllowed = todosTotalMoneyAllowed??Decimal.zero,
      todosEstimatedStartDate = todosEstimatedStartDate??DateTime(0),
      todosQuantityRejected = todosQuantityRejected??Decimal.zero,
      todosActualCompletionDate = todosActualCompletionDate??DateTime(0),
      todosLastStatusUpdate = todosLastStatusUpdate??DateTime(0),
      todosEstimatedCompletionDate = todosEstimatedCompletionDate??DateTime(0),
      todosReserv2ndPPPerc = todosReserv2ndPPPerc??Decimal.zero,
      todosLastModifiedDate = todosLastModifiedDate??DateTime(0),
      todosActualStartDate = todosActualStartDate??DateTime(0),
      todosQuantityProduced = todosQuantityProduced??Decimal.zero,   
      
      presetKeys=presetKeys??DummyPresetKeys.empty;

  DummyState copyWith({ DummyStatus? status, 
    DummyPresetKeys? presetKeys,
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
    
    Decimal? todosQuantityToProduce;
    double? todosTotalMilliSecondsAllowed;
    String? todosTempExprId;
    String? todosShowAsEnumId;
    String? todosInfoUrl;
    String? todosFixedAssetId;
    String? todosUniversalId;
    Decimal? todosReservNthPPPerc;
    Decimal? todosReservPersons;
    String? todosEstimateCalcMethod;
    String? todosServiceLoaderName;
    String? todosWorkEffortParentId;
    int? todosPercentComplete;
    DateTime? todosCreatedDate;
    int? todosPriority;
    Decimal? todosTotalMoneyAllowed;
    String? todosScopeEnumId;
    String? todosNoteId;
    String? todosAccommodationMapId;
    String? todosCreatedByUserLogin;
    String? todosRuntimeDataId;
    double? todosEstimatedMilliSeconds;
    double? todosEstimatedSetupMillis;
    String? todosSpecialTerms;
    String? todosFacilityId;
    DateTime? todosEstimatedStartDate;
    Decimal? todosQuantityRejected;
    String? todosMoneyUomId;
    String? todosLocationDesc;
    int? todosTimeTransparency;
    DateTime? todosActualCompletionDate;
    double? todosActualSetupMillis;
    String? todosWorkEffortName;
    Indicator? todosSendNotificationEmail;
    String? todosCurrentStatusId;
    String? todosSlotId;
    String? todosWorkEffortPurposeTypeId;
    String? todosWorkEffortId;
    String? todosAccommodationSpotId;
    String? todosLastModifiedByUserLogin;
    DateTime? todosLastStatusUpdate;
    DateTime? todosEstimatedCompletionDate;
    Decimal? todosReserv2ndPPPerc;
    String? todosDescription;
    Indicator? todosConfirmation;
    DateTime? todosLastModifiedDate;
    String? todosWorkEffortTypeId;
    int? todosRevisionNumber;
    DateTime? todosActualStartDate;
    String? todosSourceReferenceId;
    int? todosSequenceNum;
    double? todosActualMilliSeconds;
    String? todosRecurrenceInfoId;
    Decimal? todosQuantityProduced;
    String? todosName;
    String? todosTypeId;
    String? todosId;
    String? todosStatus;
    

    // From complicated fields  
      
    BuffersMap? notePersistSlots = slots?.asProto(
        DummyDomainDefs.notePersistSlots.index, BuffersMap.fromBuffer);    
    if (notePersistSlots != null) {
      
      noteImages = notePersistSlots.values['images'];
      noteClob = notePersistSlots.values['clob'];
      noteAttachments = notePersistSlots.values['attachments'];  
         
    }
      
    NoteProto? noteNote = slots?.asProto(
        DummyDomainDefs.noteNote.index, NoteProto.fromBuffer);    
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
        DummyDomainDefs.noteDefaultDomain.index, NoteProto.fromBuffer);    
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
        DummyDomainDefs.memoPersistSlots.index, BuffersMap.fromBuffer);    
    if (memoPersistSlots != null) {
      
      memoImages = memoPersistSlots.values['images'];
      memoClob = memoPersistSlots.values['clob'];
      memoAttachments = memoPersistSlots.values['attachments'];  
         
    }
      
    NoteProto? memoNote = slots?.asProto(
        DummyDomainDefs.memoNote.index, NoteProto.fromBuffer);    
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
      
    NoteProto? memoDefaultDomain = slots?.asProto(
        DummyDomainDefs.memoDefaultDomain.index, NoteProto.fromBuffer);    
    if (memoDefaultDomain != null) {
      
      memoNoteId = memoDefaultDomain.noteId;
      memoContent = memoDefaultDomain.content;
      memoMoreInfoItemName = memoDefaultDomain.moreInfoItemName;
      memoNoteDateTime = memoDefaultDomain.noteDateTime.dt;
      memoMoreInfoItemId = memoDefaultDomain.moreInfoItemId;
      memoTitle = memoDefaultDomain.title;
      memoAuthor = memoDefaultDomain.author;
      memoMoreInfoUrl = memoDefaultDomain.moreInfoUrl;
         
    }
        
      
      
    WorkEffortProto? todosWorkEffort = slots?.asProto(
        DummyDomainDefs.todosWorkEffort.index, WorkEffortProto.fromBuffer);    
    if (todosWorkEffort != null) {
      
      todosQuantityToProduce = todosWorkEffort.quantityToProduce.decimal;
      todosTotalMilliSecondsAllowed = todosWorkEffort.totalMilliSecondsAllowed;
      todosTempExprId = todosWorkEffort.tempExprId;
      todosShowAsEnumId = todosWorkEffort.showAsEnumId;
      todosInfoUrl = todosWorkEffort.infoUrl;
      todosFixedAssetId = todosWorkEffort.fixedAssetId;
      todosUniversalId = todosWorkEffort.universalId;
      todosReservNthPPPerc = todosWorkEffort.reservNthPPPerc.decimal;
      todosReservPersons = todosWorkEffort.reservPersons.decimal;
      todosEstimateCalcMethod = todosWorkEffort.estimateCalcMethod;
      todosServiceLoaderName = todosWorkEffort.serviceLoaderName;
      todosWorkEffortParentId = todosWorkEffort.workEffortParentId;
      todosPercentComplete = todosWorkEffort.percentComplete.toInt();
      todosCreatedDate = todosWorkEffort.createdDate.dt;
      todosPriority = todosWorkEffort.priority.toInt();
      todosTotalMoneyAllowed = todosWorkEffort.totalMoneyAllowed.decimal;
      todosScopeEnumId = todosWorkEffort.scopeEnumId;
      todosNoteId = todosWorkEffort.noteId;
      todosAccommodationMapId = todosWorkEffort.accommodationMapId;
      todosCreatedByUserLogin = todosWorkEffort.createdByUserLogin;
      todosRuntimeDataId = todosWorkEffort.runtimeDataId;
      todosEstimatedMilliSeconds = todosWorkEffort.estimatedMilliSeconds;
      todosEstimatedSetupMillis = todosWorkEffort.estimatedSetupMillis;
      todosSpecialTerms = todosWorkEffort.specialTerms;
      todosFacilityId = todosWorkEffort.facilityId;
      todosEstimatedStartDate = todosWorkEffort.estimatedStartDate.dt;
      todosQuantityRejected = todosWorkEffort.quantityRejected.decimal;
      todosMoneyUomId = todosWorkEffort.moneyUomId;
      todosLocationDesc = todosWorkEffort.locationDesc;
      todosTimeTransparency = todosWorkEffort.timeTransparency.toInt();
      todosActualCompletionDate = todosWorkEffort.actualCompletionDate.dt;
      todosActualSetupMillis = todosWorkEffort.actualSetupMillis;
      todosWorkEffortName = todosWorkEffort.workEffortName;
      todosSendNotificationEmail = todosWorkEffort.sendNotificationEmail;
      todosCurrentStatusId = todosWorkEffort.currentStatusId;
      todosSlotId = todosWorkEffort.slotId;
      todosWorkEffortPurposeTypeId = todosWorkEffort.workEffortPurposeTypeId;
      todosWorkEffortId = todosWorkEffort.workEffortId;
      todosAccommodationSpotId = todosWorkEffort.accommodationSpotId;
      todosLastModifiedByUserLogin = todosWorkEffort.lastModifiedByUserLogin;
      todosLastStatusUpdate = todosWorkEffort.lastStatusUpdate.dt;
      todosEstimatedCompletionDate = todosWorkEffort.estimatedCompletionDate.dt;
      todosReserv2ndPPPerc = todosWorkEffort.reserv2ndPPPerc.decimal;
      todosDescription = todosWorkEffort.description;
      todosConfirmation = todosWorkEffort.confirmation;
      todosLastModifiedDate = todosWorkEffort.lastModifiedDate.dt;
      todosWorkEffortTypeId = todosWorkEffort.workEffortTypeId;
      todosRevisionNumber = todosWorkEffort.revisionNumber.toInt();
      todosActualStartDate = todosWorkEffort.actualStartDate.dt;
      todosSourceReferenceId = todosWorkEffort.sourceReferenceId;
      todosSequenceNum = todosWorkEffort.sequenceNum.toInt();
      todosActualMilliSeconds = todosWorkEffort.actualMilliSeconds;
      todosRecurrenceInfoId = todosWorkEffort.recurrenceInfoId;
      todosQuantityProduced = todosWorkEffort.quantityProduced.decimal;
         
    }
      
    TodosProto? todosDefaultDomain = slots?.asProto(
        DummyDomainDefs.todosDefaultDomain.index, TodosProto.fromBuffer);    
    if (todosDefaultDomain != null) {
      
      todosDescription = todosDefaultDomain.description;
      todosName = todosDefaultDomain.name;
      todosTypeId = todosDefaultDomain.typeId;
      todosPercentComplete = todosDefaultDomain.percentComplete.toInt();
      todosId = todosDefaultDomain.id;
      todosLastStatusUpdate = todosDefaultDomain.lastStatusUpdate.dt;
      todosStatus = todosDefaultDomain.status;
         
    }
        
        

    // From scalars  
    noteAvailablePersistSlots = slots?.asStruct(DummyDomainDefs.noteAvailablePersistSlots.index) ?? noteAvailablePersistSlots;  
    noteClobSlot = slots?.asBuffers(DummyDomainDefs.noteClobSlot.index) ?? noteClobSlot;  
    noteImagesSlot = slots?.asBuffers(DummyDomainDefs.noteImagesSlot.index) ?? noteImagesSlot;  
    noteAttachmentsSlot = slots?.asBuffers(DummyDomainDefs.noteAttachmentsSlot.index) ?? noteAttachmentsSlot;  
    noteTitle = slots?.asString(DummyDomainDefs.noteTitle.index) ?? noteTitle;  
    noteContent = slots?.asString(DummyDomainDefs.noteContent.index) ?? noteContent;  
    memoAvailablePersistSlots = slots?.asStruct(DummyDomainDefs.memoAvailablePersistSlots.index) ?? memoAvailablePersistSlots;  
    memoClobSlot = slots?.asBuffers(DummyDomainDefs.memoClobSlot.index) ?? memoClobSlot;  
    memoImagesSlot = slots?.asBuffers(DummyDomainDefs.memoImagesSlot.index) ?? memoImagesSlot;  
    memoAttachmentsSlot = slots?.asBuffers(DummyDomainDefs.memoAttachmentsSlot.index) ?? memoAttachmentsSlot;  
    memoTitle = slots?.asString(DummyDomainDefs.memoTitle.index) ?? memoTitle;  
    memoContent = slots?.asString(DummyDomainDefs.memoContent.index) ?? memoContent;  
    todosPercentComplete = slots?.asLong(DummyDomainDefs.todosPercentComplete.index) ?? todosPercentComplete;

    return DummyState(
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
      
      todosQuantityToProduce: todosQuantityToProduce ?? this.todosQuantityToProduce,
      todosTotalMilliSecondsAllowed: todosTotalMilliSecondsAllowed ?? this.todosTotalMilliSecondsAllowed,
      todosTempExprId: todosTempExprId ?? this.todosTempExprId,
      todosShowAsEnumId: todosShowAsEnumId ?? this.todosShowAsEnumId,
      todosInfoUrl: todosInfoUrl ?? this.todosInfoUrl,
      todosFixedAssetId: todosFixedAssetId ?? this.todosFixedAssetId,
      todosUniversalId: todosUniversalId ?? this.todosUniversalId,
      todosReservNthPPPerc: todosReservNthPPPerc ?? this.todosReservNthPPPerc,
      todosReservPersons: todosReservPersons ?? this.todosReservPersons,
      todosEstimateCalcMethod: todosEstimateCalcMethod ?? this.todosEstimateCalcMethod,
      todosServiceLoaderName: todosServiceLoaderName ?? this.todosServiceLoaderName,
      todosWorkEffortParentId: todosWorkEffortParentId ?? this.todosWorkEffortParentId,
      todosPercentComplete: todosPercentComplete ?? this.todosPercentComplete,
      todosCreatedDate: todosCreatedDate ?? this.todosCreatedDate,
      todosPriority: todosPriority ?? this.todosPriority,
      todosTotalMoneyAllowed: todosTotalMoneyAllowed ?? this.todosTotalMoneyAllowed,
      todosScopeEnumId: todosScopeEnumId ?? this.todosScopeEnumId,
      todosNoteId: todosNoteId ?? this.todosNoteId,
      todosAccommodationMapId: todosAccommodationMapId ?? this.todosAccommodationMapId,
      todosCreatedByUserLogin: todosCreatedByUserLogin ?? this.todosCreatedByUserLogin,
      todosRuntimeDataId: todosRuntimeDataId ?? this.todosRuntimeDataId,
      todosEstimatedMilliSeconds: todosEstimatedMilliSeconds ?? this.todosEstimatedMilliSeconds,
      todosEstimatedSetupMillis: todosEstimatedSetupMillis ?? this.todosEstimatedSetupMillis,
      todosSpecialTerms: todosSpecialTerms ?? this.todosSpecialTerms,
      todosFacilityId: todosFacilityId ?? this.todosFacilityId,
      todosEstimatedStartDate: todosEstimatedStartDate ?? this.todosEstimatedStartDate,
      todosQuantityRejected: todosQuantityRejected ?? this.todosQuantityRejected,
      todosMoneyUomId: todosMoneyUomId ?? this.todosMoneyUomId,
      todosLocationDesc: todosLocationDesc ?? this.todosLocationDesc,
      todosTimeTransparency: todosTimeTransparency ?? this.todosTimeTransparency,
      todosActualCompletionDate: todosActualCompletionDate ?? this.todosActualCompletionDate,
      todosActualSetupMillis: todosActualSetupMillis ?? this.todosActualSetupMillis,
      todosWorkEffortName: todosWorkEffortName ?? this.todosWorkEffortName,
      todosSendNotificationEmail: todosSendNotificationEmail ?? this.todosSendNotificationEmail,
      todosCurrentStatusId: todosCurrentStatusId ?? this.todosCurrentStatusId,
      todosSlotId: todosSlotId ?? this.todosSlotId,
      todosWorkEffortPurposeTypeId: todosWorkEffortPurposeTypeId ?? this.todosWorkEffortPurposeTypeId,
      todosWorkEffortId: todosWorkEffortId ?? this.todosWorkEffortId,
      todosAccommodationSpotId: todosAccommodationSpotId ?? this.todosAccommodationSpotId,
      todosLastModifiedByUserLogin: todosLastModifiedByUserLogin ?? this.todosLastModifiedByUserLogin,
      todosLastStatusUpdate: todosLastStatusUpdate ?? this.todosLastStatusUpdate,
      todosEstimatedCompletionDate: todosEstimatedCompletionDate ?? this.todosEstimatedCompletionDate,
      todosReserv2ndPPPerc: todosReserv2ndPPPerc ?? this.todosReserv2ndPPPerc,
      todosDescription: todosDescription ?? this.todosDescription,
      todosConfirmation: todosConfirmation ?? this.todosConfirmation,
      todosLastModifiedDate: todosLastModifiedDate ?? this.todosLastModifiedDate,
      todosWorkEffortTypeId: todosWorkEffortTypeId ?? this.todosWorkEffortTypeId,
      todosRevisionNumber: todosRevisionNumber ?? this.todosRevisionNumber,
      todosActualStartDate: todosActualStartDate ?? this.todosActualStartDate,
      todosSourceReferenceId: todosSourceReferenceId ?? this.todosSourceReferenceId,
      todosSequenceNum: todosSequenceNum ?? this.todosSequenceNum,
      todosActualMilliSeconds: todosActualMilliSeconds ?? this.todosActualMilliSeconds,
      todosRecurrenceInfoId: todosRecurrenceInfoId ?? this.todosRecurrenceInfoId,
      todosQuantityProduced: todosQuantityProduced ?? this.todosQuantityProduced,
      todosName: todosName ?? this.todosName,
      todosTypeId: todosTypeId ?? this.todosTypeId,
      todosId: todosId ?? this.todosId,
      todosStatus: todosStatus ?? this.todosStatus,
      
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
        todosQuantityToProduce,
        todosTotalMilliSecondsAllowed,
        todosTempExprId,
        todosShowAsEnumId,
        todosInfoUrl,
        todosFixedAssetId,
        todosUniversalId,
        todosReservNthPPPerc,
        todosReservPersons,
        todosEstimateCalcMethod,
        todosServiceLoaderName,
        todosWorkEffortParentId,
        todosPercentComplete,
        todosCreatedDate,
        todosPriority,
        todosTotalMoneyAllowed,
        todosScopeEnumId,
        todosNoteId,
        todosAccommodationMapId,
        todosCreatedByUserLogin,
        todosRuntimeDataId,
        todosEstimatedMilliSeconds,
        todosEstimatedSetupMillis,
        todosSpecialTerms,
        todosFacilityId,
        todosEstimatedStartDate,
        todosQuantityRejected,
        todosMoneyUomId,
        todosLocationDesc,
        todosTimeTransparency,
        todosActualCompletionDate,
        todosActualSetupMillis,
        todosWorkEffortName,
        todosSendNotificationEmail,
        todosCurrentStatusId,
        todosSlotId,
        todosWorkEffortPurposeTypeId,
        todosWorkEffortId,
        todosAccommodationSpotId,
        todosLastModifiedByUserLogin,
        todosLastStatusUpdate,
        todosEstimatedCompletionDate,
        todosReserv2ndPPPerc,
        todosDescription,
        todosConfirmation,
        todosLastModifiedDate,
        todosWorkEffortTypeId,
        todosRevisionNumber,
        todosActualStartDate,
        todosSourceReferenceId,
        todosSequenceNum,
        todosActualMilliSeconds,
        todosRecurrenceInfoId,
        todosQuantityProduced,
        todosName,
        todosTypeId,
        todosId,
        todosStatus,
      ];
}


