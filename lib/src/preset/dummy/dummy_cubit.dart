part of 'dummy.dart';

class DummyCubit extends PresetCubit<DummyState> {

  @override
  DummyPreset? preset;
  final DummyRepository presetRepository;

  DummyCubit(this.presetRepository)
      : super(DummyState(), presetRepository.presetAgent){
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
      DummyPresetKeys presetKeys, String tag, String owner) async {
    // var requestKeys = presetKeys.asPlRequest(tag, owner);

    emit(state.copyWith(status: DummyStatus.loading));

    try {
      // Init preset
      preset = await presetRepository.loadPreset(presetKeys, tag, owner);

      // Init state with loaders
      preset!  
        .noteGetNote()  
        .noteGetNoteProto()  
        .memoGetNote()  
        .memoGetNoteProto()  
        .todosGetWorkEffort()  
        .todosGetTodosProto();

      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);
      emit(state.copyWith(status: DummyStatus.success, 
        presetKeys: preset!.keys,
        slots: wrapper));
    } on Exception {
      emit(state.copyWith(status: DummyStatus.failure));
    }
  }

    
  Future<void> noteUpdateNoteContent(
      String content   
  ) async {
    await mut(() => preset!.noteUpdateNoteContent(content)
        .noteGetContent()
    );
  }
    
  Future<void> noteSetClobSlot(
      BuffersData data   
  ) async {
    await mut(() => preset!.noteSetClobSlot(data)
        .noteGetClobSlot()
    );
  }
    
  Future<void> noteSetImagesSlot(
      BuffersData data   
  ) async {
    await mut(() => preset!.noteSetImagesSlot(data)
        .noteGetImagesSlot()
    );
  }
    
  Future<void> noteSetAttachmentsSlot(
      BuffersData data   
  ) async {
    await mut(() => preset!.noteSetAttachmentsSlot(data)
        .noteGetAttachmentsSlot()
    );
  }
    
  Future<void> noteUpdateNote(
      String content,
      String author   
  ) async {
    await mut(() => preset!.noteUpdateNote(content, author)
        .noteGetNote()
    );
  }
    
  Future<void> noteSetContentComp(
      String cnt   
  ) async {
    await mut(() => preset!.noteSetContentComp(cnt)
        .noteGetContent()
    );
  }
    
  Future<void> noteRevokeContent(   
  ) async {
    await mut(() => preset!.noteRevokeContent()
        .noteGetContent()
    );
  }
    
  Future<void> noteSetContent(
      String cnt   
  ) async {
    await mut(() => preset!.noteSetContent(cnt)
        .noteGetContent()
    );
  }
      
    
  Future<void> memoUpdateNoteContent(
      String content   
  ) async {
    await mut(() => preset!.memoUpdateNoteContent(content)
        .memoGetContent()
    );
  }
    
  Future<void> memoSetClobSlot(
      BuffersData data   
  ) async {
    await mut(() => preset!.memoSetClobSlot(data)
        .memoGetClobSlot()
    );
  }
    
  Future<void> memoSetImagesSlot(
      BuffersData data   
  ) async {
    await mut(() => preset!.memoSetImagesSlot(data)
        .memoGetImagesSlot()
    );
  }
    
  Future<void> memoSetAttachmentsSlot(
      BuffersData data   
  ) async {
    await mut(() => preset!.memoSetAttachmentsSlot(data)
        .memoGetAttachmentsSlot()
    );
  }
    
  Future<void> memoUpdateNote(
      String content,
      String author   
  ) async {
    await mut(() => preset!.memoUpdateNote(content, author)
        .memoGetNote()
    );
  }
    
  Future<void> memoSetContentComp(
      String cnt   
  ) async {
    await mut(() => preset!.memoSetContentComp(cnt)
        .memoGetContent()
    );
  }
    
  Future<void> memoRevokeContent(   
  ) async {
    await mut(() => preset!.memoRevokeContent()
        .memoGetContent()
    );
  }
    
  Future<void> memoSetContent(
      String cnt   
  ) async {
    await mut(() => preset!.memoSetContent(cnt)
        .memoGetContent()
    );
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

  List<DummyDomainDefs> translateEventKeys(Iterable<int> keys) {
    return keys.map((e) => DummyDomainDefs.values.elementAt(e))
        .toList();
  }
}


