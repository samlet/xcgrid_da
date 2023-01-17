part of 'poster.dart';

class PosterCubit extends PresetCubit<PosterState> {

  @override
  PosterPreset? preset;
  final PosterRepository presetRepository;

  PosterCubit(this.presetRepository)
      : super(PosterState(), presetRepository.presetAgent){
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
      PosterPresetKeys presetKeys, String tag, String owner) async {
    // var requestKeys = presetKeys.asPlRequest(tag, owner);

    emit(state.copyWith(status: PosterStatus.loading));

    try {
      // Init preset
      preset = await presetRepository.loadPreset(presetKeys, tag, owner);

      // Init state with loaders
      preset!  
        .noteGetNoteProto()  
        .memoGetContentAndAuthor();

      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);
      emit(state.copyWith(status: PosterStatus.success, 
        presetKeys: preset!.keys,
        slots: wrapper));
    } on Exception {
      emit(state.copyWith(status: PosterStatus.failure));
    }
  }

    
  Future<void> noteSetClob(
      BuffersData data   
  ) async {
    await mut(() => preset!.noteSetClob(data)
        .noteGetClob()
    );
  }
    
  Future<void> noteSetImages(
      BuffersData data   
  ) async {
    await mut(() => preset!.noteSetImages(data)
        .noteGetImages()
    );
  }
    
  Future<void> noteUpdateNote(
      String content,
      String author   
  ) async {
    await mut(() => preset!.noteUpdateNote(content, author)
        .noteGetNoteProto()
    );
  }
    
  Future<void> noteUpdateNoteContent(
      String content   
  ) async {
    await mut(() => preset!.noteUpdateNoteContent(content)
        .noteGetContent()
    );
  }
    
  Future<void> noteSetAttachments(
      BuffersData data   
  ) async {
    await mut(() => preset!.noteSetAttachments(data)
        .noteGetAttachments()
    );
  }
    
  Future<void> noteSetContent(
      String cnt   
  ) async {
    await mut(() => preset!.noteSetContent(cnt)
        .noteGetContent()
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
      
    
  Future<void> memoSetClob(
      BuffersData data   
  ) async {
    await mut(() => preset!.memoSetClob(data)
        .memoGetClob()
    );
  }
    
  Future<void> memoSetImages(
      BuffersData data   
  ) async {
    await mut(() => preset!.memoSetImages(data)
        .memoGetImages()
    );
  }
    
  Future<void> memoUpdateNote(
      String content,
      String author   
  ) async {
    await mut(() => preset!.memoUpdateNote(content, author)
        .memoGetContentAndAuthor()
    );
  }
    
  Future<void> memoUpdateNoteContent(
      String content   
  ) async {
    await mut(() => preset!.memoUpdateNoteContent(content)
        .memoGetContentAndAuthor()
    );
  }
    
  Future<void> memoSetAttachments(
      BuffersData data   
  ) async {
    await mut(() => preset!.memoSetAttachments(data)
        .memoGetAttachments()
    );
  }
    
  Future<void> memoPutContent(
      String content,
      String partyId   
  ) async {
    await mut(() => preset!.memoPutContent(content, partyId)
        .memoGetContentAndAuthor()
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

  List<PosterDomainDefs> translateEventKeys(Iterable<int> keys) {
    return keys.map((e) => PosterDomainDefs.values.elementAt(e))
        .toList();
  }
}


