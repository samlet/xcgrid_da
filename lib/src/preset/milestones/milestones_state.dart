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
  

  MilestonesState({
    this.status = MilestonesStatus.initial,
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
    
    MilestonesPresetKeys? presetKeys
  }):
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
      
      presetKeys=presetKeys??MilestonesPresetKeys.empty;

  MilestonesState copyWith({ MilestonesStatus? status, 
    MilestonesPresetKeys? presetKeys,
    SlotsWrapper? slots}) {
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
      
    WorkEffortProto? todosWorkEffort = slots?.asProto(
        MilestonesDomainDefs.todosWorkEffort.index, WorkEffortProto.fromBuffer);    
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
        MilestonesDomainDefs.todosDefaultDomain.index, TodosProto.fromBuffer);    
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
    todosPercentComplete = slots?.asLong(MilestonesDomainDefs.todosPercentComplete.index) ?? todosPercentComplete;

    return MilestonesState(
      status: status ?? this.status,
      presetKeys: presetKeys ?? this.presetKeys,
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


