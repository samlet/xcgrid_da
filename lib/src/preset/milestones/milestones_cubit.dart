part of 'milestones.dart';

class MilestonesCubit extends PresetCubit<MilestonesState> {

  @override
  MilestonesPreset? preset;
  final MilestonesRepository presetRepository;

  MilestonesCubit(this.presetRepository)
      : super(MilestonesState(), presetRepository.presetAgent){
    _presetStatusSubscription = presetRepository.presetController.listen((ev) async{
      if (ev is AffectsEvent) {
        var trans=translateEventKeys(ev.slots.values.keys);
        print("receive affects event: $trans");
        emit(state.copyWith(slots: ev.slots));
      }
    });
  }

  // process: PresetEvent
  late StreamSubscription<PresetEvent> _presetStatusSubscription;
  @override
  Future<void> close() {
    _presetStatusSubscription.cancel();
    return super.close();
  }

  Future<void> loadPreset(
      MilestonesPresetKeys presetKeys, String tag, String owner) async {
    // var requestKeys = presetKeys.asPlRequest(tag, owner);

    emit(state.copyWith(status: MilestonesStatus.loading));

    try {
      // Init preset
      preset = await presetRepository.loadPreset(presetKeys, tag, owner);

      // Init state with loaders
      preset!  
        .todosGetWorkEffort()  
        .todosGetTodosProto();

      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);
      emit(state.copyWith(status: MilestonesStatus.success, 
        presetKeys: preset!.keys,
        slots: wrapper));
    } on Exception {
      emit(state.copyWith(status: MilestonesStatus.failure));
    }
  }

    
  Future<void> todosAddTodoById(
      String todoId   
  ) async {
    await mut(() => preset!.todosAddTodoById(todoId)
        .todosGetPercentComplete()
    );
  }
    
  Future<void> todosMarkComplete(
      String assocId   
  ) async {
    await mut(() => preset!.todosMarkComplete(assocId)
        .todosGetPercentComplete()
    );
  }
    
  Future<void> todosAddTodo(
      String title,
      String description   
  ) async {
    await mut(() => preset!.todosAddTodo(title, description)
        .todosGetPercentComplete()
    );
  }
    
  Future<void> todosRemoveTodo(
      String assocId   
  ) async {
    await mut(() => preset!.todosRemoveTodo(assocId)
        .todosGetPercentComplete()
    );
  }
    
  Future<void> todosUpdateTodo(
      String assocId,
      String title,
      String description   
  ) async {
    await mut(() => preset!.todosUpdateTodo(assocId, title, description)
    );
  }
      
      

  Future<void> mut(Function() builder) async {
    if (!state.status.isSuccess) return;
    if (preset == null) return;

    try {
      builder();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      emit(state.copyWith(slots: wrapper));
    } on Exception catch(e){
      print("fail: $e");
      emit(state);
    }
  }

  List<MilestonesDomainDefs> translateEventKeys(Iterable<int> keys) {
    return keys.map((e) => MilestonesDomainDefs.values.elementAt(e))
        .toList();
  }
}


