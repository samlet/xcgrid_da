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
  final String todosId;   
  final String todosStatus;   
  final String todosTypeId;   
  final DateTime todosLastStatusUpdate;
  

  MilestonesState({
    this.status = MilestonesStatus.initial,
    this.todosPercentComplete = 0,
    this.todosDescription = '',
    this.todosName = '',
    this.todosId = '',
    this.todosStatus = '',
    this.todosTypeId = '',
    DateTime? todosLastStatusUpdate,   
    
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
    String? todosId;
    String? todosStatus;
    String? todosTypeId;
    DateTime? todosLastStatusUpdate;
    

    // From complicated fields
      
    TodosProto? todosDefaultDomain = slots?.asProto(
        MilestonesDomainDefs.todosDefaultDomain.index, TodosProto.fromBuffer);    
    if (todosDefaultDomain != null) {
      
      todosDescription = todosDefaultDomain.description;
      todosName = todosDefaultDomain.name;
      todosPercentComplete = todosDefaultDomain.percentComplete.toInt();
      todosId = todosDefaultDomain.id;
      todosStatus = todosDefaultDomain.status;
      todosTypeId = todosDefaultDomain.typeId;
      todosLastStatusUpdate = todosDefaultDomain.lastStatusUpdate.dt;
         
    }
        
        

    // From scalars  
    todosPercentComplete = slots?.asLong(MilestonesDomainDefs.todosPercentComplete.index) ?? todosPercentComplete;

    return MilestonesState(
      status: status ?? this.status,
      presetKeys: presetKeys ?? this.presetKeys,
      todosPercentComplete: todosPercentComplete ?? this.todosPercentComplete,
      todosDescription: todosDescription ?? this.todosDescription,
      todosName: todosName ?? this.todosName,
      todosId: todosId ?? this.todosId,
      todosStatus: todosStatus ?? this.todosStatus,
      todosTypeId: todosTypeId ?? this.todosTypeId,
      todosLastStatusUpdate: todosLastStatusUpdate ?? this.todosLastStatusUpdate,
      
    );
  }

  @override
  List<Object?> get props => [        
        status, 
        presetKeys,
        todosPercentComplete,
        todosDescription,
        todosName,
        todosId,
        todosStatus,
        todosTypeId,
        todosLastStatusUpdate,
      ];
}


