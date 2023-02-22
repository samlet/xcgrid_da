part of 'milestones.dart';

enum MilestonesStatus { initial, loading, success, failure }
extension MilestonesStatusX on MilestonesStatus {
  bool get isInitial => this == MilestonesStatus.initial;
  bool get isLoading => this == MilestonesStatus.loading;
  bool get isSuccess => this == MilestonesStatus.success;
  bool get isFailure => this == MilestonesStatus.failure;
}

class MilestonesState extends Equatable {
  final MilestonesStatus status;
  final MilestonesPresetKeys presetKeys;
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
  

  MilestonesState({
    this.status = MilestonesStatus.initial,
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
    
    MilestonesPresetKeys? presetKeys
  }):
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
      
      presetKeys=presetKeys??MilestonesPresetKeys.empty;

  MilestonesState copyWith({ MilestonesStatus? status, 
    MilestonesPresetKeys? presetKeys,
    SlotsWrapper? slots}) {
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
      
    WorkEffortProto? todosWorkEffort = slots?.asProto(
        MilestonesDomainDefs.todosWorkEffort.index, WorkEffortProto.fromBuffer);    
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
        MilestonesDomainDefs.todosDefaultDomain.index, TodosProto.fromBuffer);    
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
    todosPercentComplete = slots?.asLong(MilestonesDomainDefs.todosPercentComplete.index) ?? todosPercentComplete;

    return MilestonesState(
      status: status ?? this.status,
      presetKeys: presetKeys ?? this.presetKeys,
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


