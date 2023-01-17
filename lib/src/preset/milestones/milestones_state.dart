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
  final int todosPercentComplete;
  final String todosDescription;
  final String todosName;
  final String todosTypeId;
  final String todosId;
  final DateTime todosLastStatusUpdate;
  final String todosStatus;
  

  MilestonesState({
    this.status = MilestonesStatus.initial,
    this.todosPercentComplete = 0,
    this.todosDescription = '',
    this.todosName = '',
    this.todosTypeId = '',
    this.todosId = '',
    DateTime? todosLastStatusUpdate,
    this.todosStatus = '',   
    
    MilestonesPresetKeys? presetKeys
  }):
      todosLastStatusUpdate = todosLastStatusUpdate??DateTime(0),   
      
      presetKeys=presetKeys??MilestonesPresetKeys.empty;

  MilestonesState copyWith({ MilestonesStatus? status, 
    MilestonesPresetKeys? presetKeys,
    SlotsWrapper? slots}) {
    int? todosPercentComplete;
    String? todosDescription;
    String? todosName;
    String? todosTypeId;
    String? todosId;
    DateTime? todosLastStatusUpdate;
    String? todosStatus;
    

    // From complicated fields
      
    TodosProto? todosDefaultDomain = slots?.asProto(
        MilestonesDomainDefs.todosDefaultDomain.index, TodosProto.fromBuffer);    
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
    todosPercentComplete = slots?.asLong(MilestonesDomainDefs.todosPercentComplete.index) ?? todosPercentComplete;

    return MilestonesState(
      status: status ?? this.status,
      presetKeys: presetKeys ?? this.presetKeys,
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
        todosPercentComplete,
        todosDescription,
        todosName,
        todosTypeId,
        todosId,
        todosLastStatusUpdate,
        todosStatus,
      ];
}


