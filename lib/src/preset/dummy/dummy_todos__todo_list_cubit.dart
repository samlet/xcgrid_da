part of 'dummy.dart';

class DummyTodos_TodoListCubit extends Cubit<DummyTodoListState> {
  DummyTodos_TodoListCubit({required this.repository})
      : super(const DummyTodoListState.loading()) {
    _presetStatusSubscription = repository.presetController.listen((ev) async{
      if (ev is LoadDummyPresetKeysEvent) {
        print("receive load-preset event: ${ev.presetKeys}");
        preset = DummyPreset(ev.presetKeys, presetAgent: repository.presetAgent);
        await getTodoProtoList();
      }
    });
  }

  final DummyRepository repository;
  DummyPreset? preset;

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
      emit(DummyTodoListState.success(asItems(protoList)));
    } on Exception {
      emit(const DummyTodoListState.failure());
    }
  }

  
     

  
  // add item
  Future<void> addTodo(
      String title,
      String description   
  ) async {
    if(state.status==DummyTodoListStatus.success){
      preset!.todosAddTodo(title, description).todosGetPercentComplete();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      TodoProto? result = wrapper.asProto(
          DummyDomainDefs.todosAddTodo.index,
          TodoProto.fromBuffer);
      emit(DummyTodoListState.success([...state.items,
        DummyTodoItem(value: result!)]));

      // notify domain cubit
      repository.emit(AffectsEvent(wrapper));
    }
  }
  

     
  
  
  // remove item
  Future<void> removeTodo(String assocId) async {
    final deleteInProgress = state.items.map((item) {
      return item.id == assocId ? item.copyWith(isDeleting: true) : item;
    }).toList();

    emit(DummyTodoListState.success(deleteInProgress));

    preset!.todosRemoveTodo(assocId).todosGetPercentComplete();
    unawaited(
      preset!.dispatch().then((slots) {
        final deleteSuccess = List.of(state.items)
          ..removeWhere((element) => element.id == assocId);
        emit(DummyTodoListState.success(deleteSuccess));

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
    if(state.status==DummyTodoListStatus.success){
      // update remote item
      preset!.todosUpdateTodo(assocId, title, description);
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      TodoProto? result = wrapper.asProto(
          DummyDomainDefs.todosUpdateTodo.index,
          TodoProto.fromBuffer);

      // update local items
      final items = [...state.items];
      final itemIndex = items.indexWhere((t) => t.id == assocId);
      if (itemIndex >= 0) {
        items[itemIndex] = DummyTodoItem(value: result!);
      } else {
        print("error, not found $assocId in items");
        return;
      }

      emit(DummyTodoListState.success(items));

      // notify domain cubit
      repository.emit(AffectsEvent(wrapper));
    }
  }
     
  
     

  
  // add item
  Future<void> addTodoById(
      String todoId   
  ) async {
    if(state.status==DummyTodoListStatus.success){
      preset!.todosAddTodoById(todoId).todosGetPercentComplete();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      TodoProto? result = wrapper.asProto(
          DummyDomainDefs.todosAddTodoById.index,
          TodoProto.fromBuffer);
      emit(DummyTodoListState.success([...state.items,
        DummyTodoItem(value: result!)]));

      // notify domain cubit
      repository.emit(AffectsEvent(wrapper));
    }
  }
  

     
  
     

  

  
  // modify item
  Future<void> markComplete(
      String assocId   
  ) async {
    if(state.status==DummyTodoListStatus.success){
      // update remote item
      preset!.todosMarkComplete(assocId).todosGetPercentComplete();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);

      TodoProto? result = wrapper.asProto(
          DummyDomainDefs.todosMarkComplete.index,
          TodoProto.fromBuffer);

      // update local items
      final items = [...state.items];
      final itemIndex = items.indexWhere((t) => t.id == assocId);
      if (itemIndex >= 0) {
        items[itemIndex] = DummyTodoItem(value: result!);
      } else {
        print("error, not found $assocId in items");
        return;
      }

      emit(DummyTodoListState.success(items));

      // notify domain cubit
      repository.emit(AffectsEvent(wrapper));
    }
  }
     
      

  List<DummyTodoItem> asItems(TodoProtoList protoList) {
    return protoList.items.map((e) => DummyTodoItem(value: e)).toList();
  }
}



