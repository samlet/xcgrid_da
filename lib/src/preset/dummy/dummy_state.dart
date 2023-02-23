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
  
  // Fields for todos   
  final Decimal todosQuantityToProduce;   
  final String todosRuntimeDataId;   
  final double todosTotalMilliSecondsAllowed;   
  final String todosScopeEnumId;   
  final Decimal todosReservNthPPPerc;   
  final DateTime todosEstimatedStartDate;   
  final Decimal todosReservPersons;   
  final String todosAccommodationMapId;   
  final String todosWorkEffortPurposeTypeId;   
  final String todosSlotId;   
  final int todosPercentComplete;   
  final String todosServiceLoaderName;   
  final String todosWorkEffortId;   
  final int todosPriority;   
  final Decimal todosTotalMoneyAllowed;   
  final String todosMoneyUomId;   
  final String todosLocationDesc;   
  final String todosFixedAssetId;   
  final String todosFacilityId;   
  final String todosUniversalId;   
  final String todosShowAsEnumId;   
  final String todosInfoUrl;   
  final DateTime todosLastStatusUpdate;   
  final double todosEstimatedMilliSeconds;   
  final double todosEstimatedSetupMillis;   
  final String todosCreatedByUserLogin;   
  final String todosSpecialTerms;   
  final DateTime todosEstimatedCompletionDate;   
  final Decimal todosQuantityRejected;   
  final int todosTimeTransparency;   
  final String todosDescription;   
  final double todosActualSetupMillis;   
  final String todosNoteId;   
  final Indicator todosSendNotificationEmail;   
  final String todosWorkEffortTypeId;   
  final String todosLastModifiedByUserLogin;   
  final String todosCurrentStatusId;   
  final String todosWorkEffortParentId;   
  final String todosAccommodationSpotId;   
  final String todosEstimateCalcMethod;   
  final Decimal todosReserv2ndPPPerc;   
  final DateTime todosCreatedDate;   
  final DateTime todosActualCompletionDate;   
  final DateTime todosLastModifiedDate;   
  final String todosWorkEffortName;   
  final Indicator todosConfirmation;   
  final int todosRevisionNumber;   
  final String todosSourceReferenceId;   
  final String todosRecurrenceInfoId;   
  final String todosTempExprId;   
  final int todosSequenceNum;   
  final DateTime todosActualStartDate;   
  final double todosActualMilliSeconds;   
  final Decimal todosQuantityProduced;   
  final String todosName;   
  final String todosTypeId;   
  final String todosId;   
  final String todosStatus;
  

  DummyState({
    this.status = DummyStatus.initial,
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
    
    Decimal? todosQuantityToProduce,
    this.todosRuntimeDataId = '',
    this.todosTotalMilliSecondsAllowed = 0.0,
    this.todosScopeEnumId = '',
    Decimal? todosReservNthPPPerc,
    DateTime? todosEstimatedStartDate,
    Decimal? todosReservPersons,
    this.todosAccommodationMapId = '',
    this.todosWorkEffortPurposeTypeId = '',
    this.todosSlotId = '',
    this.todosPercentComplete = 0,
    this.todosServiceLoaderName = '',
    this.todosWorkEffortId = '',
    this.todosPriority = 0,
    Decimal? todosTotalMoneyAllowed,
    this.todosMoneyUomId = '',
    this.todosLocationDesc = '',
    this.todosFixedAssetId = '',
    this.todosFacilityId = '',
    this.todosUniversalId = '',
    this.todosShowAsEnumId = '',
    this.todosInfoUrl = '',
    DateTime? todosLastStatusUpdate,
    this.todosEstimatedMilliSeconds = 0.0,
    this.todosEstimatedSetupMillis = 0.0,
    this.todosCreatedByUserLogin = '',
    this.todosSpecialTerms = '',
    DateTime? todosEstimatedCompletionDate,
    Decimal? todosQuantityRejected,
    this.todosTimeTransparency = 0,
    this.todosDescription = '',
    this.todosActualSetupMillis = 0.0,
    this.todosNoteId = '',
    this.todosSendNotificationEmail = Indicator.NO,
    this.todosWorkEffortTypeId = '',
    this.todosLastModifiedByUserLogin = '',
    this.todosCurrentStatusId = '',
    this.todosWorkEffortParentId = '',
    this.todosAccommodationSpotId = '',
    this.todosEstimateCalcMethod = '',
    Decimal? todosReserv2ndPPPerc,
    DateTime? todosCreatedDate,
    DateTime? todosActualCompletionDate,
    DateTime? todosLastModifiedDate,
    this.todosWorkEffortName = '',
    this.todosConfirmation = Indicator.NO,
    this.todosRevisionNumber = 0,
    this.todosSourceReferenceId = '',
    this.todosRecurrenceInfoId = '',
    this.todosTempExprId = '',
    this.todosSequenceNum = 0,
    DateTime? todosActualStartDate,
    this.todosActualMilliSeconds = 0.0,
    Decimal? todosQuantityProduced,
    this.todosName = '',
    this.todosTypeId = '',
    this.todosId = '',
    this.todosStatus = '',   
    
    DummyPresetKeys? presetKeys
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
      
      todosQuantityToProduce = todosQuantityToProduce??Decimal.zero,
      todosReservNthPPPerc = todosReservNthPPPerc??Decimal.zero,
      todosEstimatedStartDate = todosEstimatedStartDate??DateTime(0),
      todosReservPersons = todosReservPersons??Decimal.zero,
      todosTotalMoneyAllowed = todosTotalMoneyAllowed??Decimal.zero,
      todosLastStatusUpdate = todosLastStatusUpdate??DateTime(0),
      todosEstimatedCompletionDate = todosEstimatedCompletionDate??DateTime(0),
      todosQuantityRejected = todosQuantityRejected??Decimal.zero,
      todosReserv2ndPPPerc = todosReserv2ndPPPerc??Decimal.zero,
      todosCreatedDate = todosCreatedDate??DateTime(0),
      todosActualCompletionDate = todosActualCompletionDate??DateTime(0),
      todosLastModifiedDate = todosLastModifiedDate??DateTime(0),
      todosActualStartDate = todosActualStartDate??DateTime(0),
      todosQuantityProduced = todosQuantityProduced??Decimal.zero,   
      
      presetKeys=presetKeys??DummyPresetKeys.empty;

  DummyState copyWith({ DummyStatus? status, 
    DummyPresetKeys? presetKeys,
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
    
    Decimal? todosQuantityToProduce;
    String? todosRuntimeDataId;
    double? todosTotalMilliSecondsAllowed;
    String? todosScopeEnumId;
    Decimal? todosReservNthPPPerc;
    DateTime? todosEstimatedStartDate;
    Decimal? todosReservPersons;
    String? todosAccommodationMapId;
    String? todosWorkEffortPurposeTypeId;
    String? todosSlotId;
    int? todosPercentComplete;
    String? todosServiceLoaderName;
    String? todosWorkEffortId;
    int? todosPriority;
    Decimal? todosTotalMoneyAllowed;
    String? todosMoneyUomId;
    String? todosLocationDesc;
    String? todosFixedAssetId;
    String? todosFacilityId;
    String? todosUniversalId;
    String? todosShowAsEnumId;
    String? todosInfoUrl;
    DateTime? todosLastStatusUpdate;
    double? todosEstimatedMilliSeconds;
    double? todosEstimatedSetupMillis;
    String? todosCreatedByUserLogin;
    String? todosSpecialTerms;
    DateTime? todosEstimatedCompletionDate;
    Decimal? todosQuantityRejected;
    int? todosTimeTransparency;
    String? todosDescription;
    double? todosActualSetupMillis;
    String? todosNoteId;
    Indicator? todosSendNotificationEmail;
    String? todosWorkEffortTypeId;
    String? todosLastModifiedByUserLogin;
    String? todosCurrentStatusId;
    String? todosWorkEffortParentId;
    String? todosAccommodationSpotId;
    String? todosEstimateCalcMethod;
    Decimal? todosReserv2ndPPPerc;
    DateTime? todosCreatedDate;
    DateTime? todosActualCompletionDate;
    DateTime? todosLastModifiedDate;
    String? todosWorkEffortName;
    Indicator? todosConfirmation;
    int? todosRevisionNumber;
    String? todosSourceReferenceId;
    String? todosRecurrenceInfoId;
    String? todosTempExprId;
    int? todosSequenceNum;
    DateTime? todosActualStartDate;
    double? todosActualMilliSeconds;
    Decimal? todosQuantityProduced;
    String? todosName;
    String? todosTypeId;
    String? todosId;
    String? todosStatus;
    

    // From complicated fields  
      
    NoteProto? noteNote = slots?.asProto(
        DummyDomainDefs.noteNote.index, NoteProto.fromBuffer);    
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
        DummyDomainDefs.notePersistSlots.index, BuffersMap.fromBuffer);    
    if (notePersistSlots != null) {
      
      noteClob = notePersistSlots.values['clob'];
      noteImages = notePersistSlots.values['images'];
      noteAttachments = notePersistSlots.values['attachments'];  
         
    }
      
    NoteProto? noteDefaultDomain = slots?.asProto(
        DummyDomainDefs.noteDefaultDomain.index, NoteProto.fromBuffer);    
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
        DummyDomainDefs.memoNote.index, NoteProto.fromBuffer);    
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
        DummyDomainDefs.memoPersistSlots.index, BuffersMap.fromBuffer);    
    if (memoPersistSlots != null) {
      
      memoClob = memoPersistSlots.values['clob'];
      memoImages = memoPersistSlots.values['images'];
      memoAttachments = memoPersistSlots.values['attachments'];  
         
    }
      
    NoteProto? memoDefaultDomain = slots?.asProto(
        DummyDomainDefs.memoDefaultDomain.index, NoteProto.fromBuffer);    
    if (memoDefaultDomain != null) {
      
      memoAuthor = memoDefaultDomain.author;
      memoTitle = memoDefaultDomain.title;
      memoNoteDateTime = memoDefaultDomain.noteDateTime.dt;
      memoContent = memoDefaultDomain.content;
      memoMoreInfoItemName = memoDefaultDomain.moreInfoItemName;
      memoNoteId = memoDefaultDomain.noteId;
      memoMoreInfoItemId = memoDefaultDomain.moreInfoItemId;
      memoMoreInfoUrl = memoDefaultDomain.moreInfoUrl;
         
    }
        
      
      
    WorkEffortProto? todosWorkEffort = slots?.asProto(
        DummyDomainDefs.todosWorkEffort.index, WorkEffortProto.fromBuffer);    
    if (todosWorkEffort != null) {
      
      todosQuantityToProduce = todosWorkEffort.quantityToProduce.decimal;
      todosRuntimeDataId = todosWorkEffort.runtimeDataId;
      todosTotalMilliSecondsAllowed = todosWorkEffort.totalMilliSecondsAllowed;
      todosScopeEnumId = todosWorkEffort.scopeEnumId;
      todosReservNthPPPerc = todosWorkEffort.reservNthPPPerc.decimal;
      todosEstimatedStartDate = todosWorkEffort.estimatedStartDate.dt;
      todosReservPersons = todosWorkEffort.reservPersons.decimal;
      todosAccommodationMapId = todosWorkEffort.accommodationMapId;
      todosWorkEffortPurposeTypeId = todosWorkEffort.workEffortPurposeTypeId;
      todosSlotId = todosWorkEffort.slotId;
      todosPercentComplete = todosWorkEffort.percentComplete.toInt();
      todosServiceLoaderName = todosWorkEffort.serviceLoaderName;
      todosWorkEffortId = todosWorkEffort.workEffortId;
      todosPriority = todosWorkEffort.priority.toInt();
      todosTotalMoneyAllowed = todosWorkEffort.totalMoneyAllowed.decimal;
      todosMoneyUomId = todosWorkEffort.moneyUomId;
      todosLocationDesc = todosWorkEffort.locationDesc;
      todosFixedAssetId = todosWorkEffort.fixedAssetId;
      todosFacilityId = todosWorkEffort.facilityId;
      todosUniversalId = todosWorkEffort.universalId;
      todosShowAsEnumId = todosWorkEffort.showAsEnumId;
      todosInfoUrl = todosWorkEffort.infoUrl;
      todosLastStatusUpdate = todosWorkEffort.lastStatusUpdate.dt;
      todosEstimatedMilliSeconds = todosWorkEffort.estimatedMilliSeconds;
      todosEstimatedSetupMillis = todosWorkEffort.estimatedSetupMillis;
      todosCreatedByUserLogin = todosWorkEffort.createdByUserLogin;
      todosSpecialTerms = todosWorkEffort.specialTerms;
      todosEstimatedCompletionDate = todosWorkEffort.estimatedCompletionDate.dt;
      todosQuantityRejected = todosWorkEffort.quantityRejected.decimal;
      todosTimeTransparency = todosWorkEffort.timeTransparency.toInt();
      todosDescription = todosWorkEffort.description;
      todosActualSetupMillis = todosWorkEffort.actualSetupMillis;
      todosNoteId = todosWorkEffort.noteId;
      todosSendNotificationEmail = todosWorkEffort.sendNotificationEmail;
      todosWorkEffortTypeId = todosWorkEffort.workEffortTypeId;
      todosLastModifiedByUserLogin = todosWorkEffort.lastModifiedByUserLogin;
      todosCurrentStatusId = todosWorkEffort.currentStatusId;
      todosWorkEffortParentId = todosWorkEffort.workEffortParentId;
      todosAccommodationSpotId = todosWorkEffort.accommodationSpotId;
      todosEstimateCalcMethod = todosWorkEffort.estimateCalcMethod;
      todosReserv2ndPPPerc = todosWorkEffort.reserv2ndPPPerc.decimal;
      todosCreatedDate = todosWorkEffort.createdDate.dt;
      todosActualCompletionDate = todosWorkEffort.actualCompletionDate.dt;
      todosLastModifiedDate = todosWorkEffort.lastModifiedDate.dt;
      todosWorkEffortName = todosWorkEffort.workEffortName;
      todosConfirmation = todosWorkEffort.confirmation;
      todosRevisionNumber = todosWorkEffort.revisionNumber.toInt();
      todosSourceReferenceId = todosWorkEffort.sourceReferenceId;
      todosRecurrenceInfoId = todosWorkEffort.recurrenceInfoId;
      todosTempExprId = todosWorkEffort.tempExprId;
      todosSequenceNum = todosWorkEffort.sequenceNum.toInt();
      todosActualStartDate = todosWorkEffort.actualStartDate.dt;
      todosActualMilliSeconds = todosWorkEffort.actualMilliSeconds;
      todosQuantityProduced = todosWorkEffort.quantityProduced.decimal;
         
    }
      
    TodosProto? todosDefaultDomain = slots?.asProto(
        DummyDomainDefs.todosDefaultDomain.index, TodosProto.fromBuffer);    
    if (todosDefaultDomain != null) {
      
      todosName = todosDefaultDomain.name;
      todosTypeId = todosDefaultDomain.typeId;
      todosPercentComplete = todosDefaultDomain.percentComplete.toInt();
      todosDescription = todosDefaultDomain.description;
      todosId = todosDefaultDomain.id;
      todosStatus = todosDefaultDomain.status;
      todosLastStatusUpdate = todosDefaultDomain.lastStatusUpdate.dt;
         
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
      
      todosQuantityToProduce: todosQuantityToProduce ?? this.todosQuantityToProduce,
      todosRuntimeDataId: todosRuntimeDataId ?? this.todosRuntimeDataId,
      todosTotalMilliSecondsAllowed: todosTotalMilliSecondsAllowed ?? this.todosTotalMilliSecondsAllowed,
      todosScopeEnumId: todosScopeEnumId ?? this.todosScopeEnumId,
      todosReservNthPPPerc: todosReservNthPPPerc ?? this.todosReservNthPPPerc,
      todosEstimatedStartDate: todosEstimatedStartDate ?? this.todosEstimatedStartDate,
      todosReservPersons: todosReservPersons ?? this.todosReservPersons,
      todosAccommodationMapId: todosAccommodationMapId ?? this.todosAccommodationMapId,
      todosWorkEffortPurposeTypeId: todosWorkEffortPurposeTypeId ?? this.todosWorkEffortPurposeTypeId,
      todosSlotId: todosSlotId ?? this.todosSlotId,
      todosPercentComplete: todosPercentComplete ?? this.todosPercentComplete,
      todosServiceLoaderName: todosServiceLoaderName ?? this.todosServiceLoaderName,
      todosWorkEffortId: todosWorkEffortId ?? this.todosWorkEffortId,
      todosPriority: todosPriority ?? this.todosPriority,
      todosTotalMoneyAllowed: todosTotalMoneyAllowed ?? this.todosTotalMoneyAllowed,
      todosMoneyUomId: todosMoneyUomId ?? this.todosMoneyUomId,
      todosLocationDesc: todosLocationDesc ?? this.todosLocationDesc,
      todosFixedAssetId: todosFixedAssetId ?? this.todosFixedAssetId,
      todosFacilityId: todosFacilityId ?? this.todosFacilityId,
      todosUniversalId: todosUniversalId ?? this.todosUniversalId,
      todosShowAsEnumId: todosShowAsEnumId ?? this.todosShowAsEnumId,
      todosInfoUrl: todosInfoUrl ?? this.todosInfoUrl,
      todosLastStatusUpdate: todosLastStatusUpdate ?? this.todosLastStatusUpdate,
      todosEstimatedMilliSeconds: todosEstimatedMilliSeconds ?? this.todosEstimatedMilliSeconds,
      todosEstimatedSetupMillis: todosEstimatedSetupMillis ?? this.todosEstimatedSetupMillis,
      todosCreatedByUserLogin: todosCreatedByUserLogin ?? this.todosCreatedByUserLogin,
      todosSpecialTerms: todosSpecialTerms ?? this.todosSpecialTerms,
      todosEstimatedCompletionDate: todosEstimatedCompletionDate ?? this.todosEstimatedCompletionDate,
      todosQuantityRejected: todosQuantityRejected ?? this.todosQuantityRejected,
      todosTimeTransparency: todosTimeTransparency ?? this.todosTimeTransparency,
      todosDescription: todosDescription ?? this.todosDescription,
      todosActualSetupMillis: todosActualSetupMillis ?? this.todosActualSetupMillis,
      todosNoteId: todosNoteId ?? this.todosNoteId,
      todosSendNotificationEmail: todosSendNotificationEmail ?? this.todosSendNotificationEmail,
      todosWorkEffortTypeId: todosWorkEffortTypeId ?? this.todosWorkEffortTypeId,
      todosLastModifiedByUserLogin: todosLastModifiedByUserLogin ?? this.todosLastModifiedByUserLogin,
      todosCurrentStatusId: todosCurrentStatusId ?? this.todosCurrentStatusId,
      todosWorkEffortParentId: todosWorkEffortParentId ?? this.todosWorkEffortParentId,
      todosAccommodationSpotId: todosAccommodationSpotId ?? this.todosAccommodationSpotId,
      todosEstimateCalcMethod: todosEstimateCalcMethod ?? this.todosEstimateCalcMethod,
      todosReserv2ndPPPerc: todosReserv2ndPPPerc ?? this.todosReserv2ndPPPerc,
      todosCreatedDate: todosCreatedDate ?? this.todosCreatedDate,
      todosActualCompletionDate: todosActualCompletionDate ?? this.todosActualCompletionDate,
      todosLastModifiedDate: todosLastModifiedDate ?? this.todosLastModifiedDate,
      todosWorkEffortName: todosWorkEffortName ?? this.todosWorkEffortName,
      todosConfirmation: todosConfirmation ?? this.todosConfirmation,
      todosRevisionNumber: todosRevisionNumber ?? this.todosRevisionNumber,
      todosSourceReferenceId: todosSourceReferenceId ?? this.todosSourceReferenceId,
      todosRecurrenceInfoId: todosRecurrenceInfoId ?? this.todosRecurrenceInfoId,
      todosTempExprId: todosTempExprId ?? this.todosTempExprId,
      todosSequenceNum: todosSequenceNum ?? this.todosSequenceNum,
      todosActualStartDate: todosActualStartDate ?? this.todosActualStartDate,
      todosActualMilliSeconds: todosActualMilliSeconds ?? this.todosActualMilliSeconds,
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
        todosQuantityToProduce,
        todosRuntimeDataId,
        todosTotalMilliSecondsAllowed,
        todosScopeEnumId,
        todosReservNthPPPerc,
        todosEstimatedStartDate,
        todosReservPersons,
        todosAccommodationMapId,
        todosWorkEffortPurposeTypeId,
        todosSlotId,
        todosPercentComplete,
        todosServiceLoaderName,
        todosWorkEffortId,
        todosPriority,
        todosTotalMoneyAllowed,
        todosMoneyUomId,
        todosLocationDesc,
        todosFixedAssetId,
        todosFacilityId,
        todosUniversalId,
        todosShowAsEnumId,
        todosInfoUrl,
        todosLastStatusUpdate,
        todosEstimatedMilliSeconds,
        todosEstimatedSetupMillis,
        todosCreatedByUserLogin,
        todosSpecialTerms,
        todosEstimatedCompletionDate,
        todosQuantityRejected,
        todosTimeTransparency,
        todosDescription,
        todosActualSetupMillis,
        todosNoteId,
        todosSendNotificationEmail,
        todosWorkEffortTypeId,
        todosLastModifiedByUserLogin,
        todosCurrentStatusId,
        todosWorkEffortParentId,
        todosAccommodationSpotId,
        todosEstimateCalcMethod,
        todosReserv2ndPPPerc,
        todosCreatedDate,
        todosActualCompletionDate,
        todosLastModifiedDate,
        todosWorkEffortName,
        todosConfirmation,
        todosRevisionNumber,
        todosSourceReferenceId,
        todosRecurrenceInfoId,
        todosTempExprId,
        todosSequenceNum,
        todosActualStartDate,
        todosActualMilliSeconds,
        todosQuantityProduced,
        todosName,
        todosTypeId,
        todosId,
        todosStatus,
      ];
}


