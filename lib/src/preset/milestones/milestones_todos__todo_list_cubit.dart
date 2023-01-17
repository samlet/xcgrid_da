part of 'milestones.dart';

class MilestonesTodos_TodoListCubit extends Cubit<MilestonesTodoListState> {
  MilestonesTodos_TodoListCubit({required this.repository})
      : super(const MilestonesTodoListState.loading()) {
    _presetStatusSubscription = repository.presetController.listen((ev) async{
      if (ev is LoadMilestonesPresetKeysEvent) {
        print("receive load-preset event: ${ev.presetKeys}");
        preset = MilestonesPreset(ev.presetKeys, presetAgent: repository.presetAgent);
        await getTodoProtoList();
      }
    });
  }

  final MilestonesRepository repository;
  MilestonesPreset? preset;

  // PresetEvent
  late StreamSubscription<PresetEvent> _presetStatusSubscription;
  @override
  Future<void> close() {
    _presetStatusSubscription.cancel();
    return super.close();
  }

  // fetch list
  Future<void> getTodoProtoList() async {
    // if(preset==null) return;
    try {
      final protoList = await preset!.todosGetTodoProtoListCall();
      emit(MilestonesTodoListState.success(asItems(protoList)));
    } on Exception {
      emit(const MilestonesTodoListState.failure());
    }
  }

  
     

  
  // add item
  Future<void> addTodo(
      String title,
      String description   
  ) async {
    if(state.status==MilestonesTodoListStatus.success){
      preset!.todosAddTodo(title, description).todosGetPercentComplete();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      TodoProto? result = wrapper.asProto(
          MilestonesDomainDefs.todosAddTodo.index,
          TodoProto.fromBuffer);
      emit(MilestonesTodoListState.success([...state.items,
        MilestonesTodoItem(value: result!)]));

      // notify domain cubit
      repository.emit(AffectsEvent(wrapper));
    }
  }
  

     
  
  
  // remove item
  Future<void> removeTodo(String assocId) async {
    final deleteInProgress = state.items.map((item) {
      return item.id == assocId ? item.copyWith(isDeleting: true) : item;
    }).toList();

    emit(MilestonesTodoListState.success(deleteInProgress));

    preset!.todosRemoveTodo(assocId).todosGetPercentComplete();
    unawaited(
      preset!.dispatch().then((slots) {
        final deleteSuccess = List.of(state.items)
          ..removeWhere((element) => element.id == assocId);
        emit(MilestonesTodoListState.success(deleteSuccess));

        // notify domain cubit
        repository.emit(AffectsEvent(SlotsWrapper(slots)));
      }),
    );
  }
     

  

     
  
     

  

  
  // modify item
  Future<void> updateTodo(
      String assocId,
      String title,
      String description   
  ) async {
    if(state.status==MilestonesTodoListStatus.success){
      // update remote item
      preset!.todosUpdateTodo(assocId, title, description);
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      TodoProto? result = wrapper.asProto(
          MilestonesDomainDefs.todosUpdateTodo.index,
          TodoProto.fromBuffer);

      // update local items
      final items = [...state.items];
      final itemIndex = items.indexWhere((t) => t.id == assocId);
      if (itemIndex >= 0) {
        items[itemIndex] = MilestonesTodoItem(value: result!);
      } else {
        print("error, not found $assocId in items");
        return;
      }

      emit(MilestonesTodoListState.success(items));

      // notify domain cubit
      repository.emit(AffectsEvent(wrapper));
    }
  }
     
  
     

  
  // add item
  Future<void> addTodoById(
      String todoId   
  ) async {
    if(state.status==MilestonesTodoListStatus.success){
      preset!.todosAddTodoById(todoId).todosGetPercentComplete();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      TodoProto? result = wrapper.asProto(
          MilestonesDomainDefs.todosAddTodoById.index,
          TodoProto.fromBuffer);
      emit(MilestonesTodoListState.success([...state.items,
        MilestonesTodoItem(value: result!)]));

      // notify domain cubit
      repository.emit(AffectsEvent(wrapper));
    }
  }
  

     
  
     

  

  
  // modify item
  Future<void> markComplete(
      String assocId   
  ) async {
    if(state.status==MilestonesTodoListStatus.success){
      // update remote item
      preset!.todosMarkComplete(assocId).todosGetPercentComplete();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      TodoProto? result = wrapper.asProto(
          MilestonesDomainDefs.todosMarkComplete.index,
          TodoProto.fromBuffer);

      // update local items
      final items = [...state.items];
      final itemIndex = items.indexWhere((t) => t.id == assocId);
      if (itemIndex >= 0) {
        items[itemIndex] = MilestonesTodoItem(value: result!);
      } else {
        print("error, not found $assocId in items");
        return;
      }

      emit(MilestonesTodoListState.success(items));

      // notify domain cubit
      repository.emit(AffectsEvent(wrapper));
    }
  }
     
      

  List<MilestonesTodoItem> asItems(TodoProtoList protoList) {
    return protoList.items.map((e) => MilestonesTodoItem(value: e)).toList();
  }
}



