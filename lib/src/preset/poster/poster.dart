import 'package:xcgrid_da/preset_common.dart';
import '../../generated/note.pb.dart';
import '../../generated/note_domain.pb.dart';
import '../../generated/note_co.pb.dart';
import '../../generated/note_auto.pb.dart';
import '../../generated/white_board_handle.pb.dart';
import '../../generated/fixture_objects.pb.dart';
import '../../generated/note_auto_handle.pb.dart';
import '../../generated/white_board.pb.dart';
import '../../generated/note_co_handle.pb.dart';

part 'poster_defs.dart';
part 'poster_loader.dart';
part 'poster_repository.dart';

// for domain
part 'poster_state.dart';
part 'poster_cubit.dart';

// for list

class PosterPresetKeys extends Equatable {
  final String regionId;
  BundleKey get regionKey => BundleKey(regionId: regionId);
  final String? plId;
  BundleKey? get plKey => plId!=null?BundleKey(regionId: regionId, id: plId):null;
  final String noteId;
  BundleKey get noteKey => BundleKey(regionId: regionId, id: noteId);
  final String memoId;
  BundleKey get memoKey => BundleKey(regionId: regionId, id: memoId);

  PosterPresetKeys({
    required this.noteId,
    required this.memoId,
    this.plId,
    this.regionId='default'});

  static final empty = PosterPresetKeys(
      noteId: '',
      memoId: '',
  );

  factory PosterPresetKeys.fromMap(Map<String, String> keysMap){
    return PosterPresetKeys(
        noteId: keysMap['noteId']!,
        memoId: keysMap['memoId']!,
        plId: keysMap['plId'],
        regionId: keysMap['regionId']??'default'
    );
  }

  factory PosterPresetKeys.fromMeta(CallBuilderContextProto meta){
    Map<String, BundleKey> keysMap = meta.keys;
    return PosterPresetKeys(
        noteId: keysMap['note']!.id,
        memoId: keysMap['memo']!.id,
        plId: meta.plXid.bundleId,
        regionId: meta.regionId
    );
  }

  Map<String, String> get keys => {
    'noteId': noteId,
    'memoId': memoId,
  };

  Map<String, BundleKey> get bundleKeys => {
    'note': noteKey,
    'memo': memoKey,
    'fixtures': regionKey,       
  };

  PresetManagerCreatePresetPlRequest asPlRequest(String tag, String owner){
    return PresetManagerCreatePresetPlRequest()
      ..regionId = regionId
      ..presetName = 'Poster'
      ..owner = owner
      ..tag = tag
      ..keys = StringMap(values: keys);
  }

  CallBuilderContextProto asCallBuilderProto(String tag, String owner){
    return CallBuilderContextProto()
      ..regionId = regionId
      ..presetName = "Poster"
      ..owner = owner
      ..tag = tag
      ..keys.addAll(bundleKeys);
  }

  @override
  List<Object?> get props => [
    regionId, 
    plId,
    noteId,
    memoId,
  ];
}

class PosterPreset extends PresetBase {
  final PosterPresetKeys keys;
  BundleKey get note => keys.noteKey;
  BundleKey get memo => keys.memoKey;
  BundleKey get fixtures => keys.regionKey;       

  PosterPreset(
      this.keys,
      {PresetDispatcherAgent? presetAgent})
      : super(presetAgent ?? XcClient().presetDispatcherAgent(),
            keys.plKey ?? BundleKey(regionId: 'default', id: slugId()));

  PosterPreset saga(){
    currentState=BuilderState.bsSaga;
    return this;
  }

     
  
  NoteAutoHandle get noteWithNoteAutoHandle {
    return NoteAutoHandle()
      ..regionId = note.regionId
      ..bundleId = note.id;
  }     

     
  PosterPreset noteGetImagesSlot(
  ) {
    
    var el = NoteAutoCall()
      ..getImagesSlot = noteWithNoteAutoHandle;    
       
     

    // final c = NoteDefs.IMAGES_SLOT.value;
    final c = PosterDomainDefs.noteImagesSlot.index;
    pushCall("noteGetImagesSlot", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersData> noteGetImagesSlotCall(
  ) async {
    noteGetImagesSlot();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset noteUpdateNote(
    String content,
    String author
  ) {
    
    var el = NoteAutoCall()
      ..updateNote = (NoteAutoUpdateNoteRequest()
        ..handle = noteWithNoteAutoHandle
        ..content = content
        ..author = author       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteUpdateNote", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteUpdateNoteCall(
    String content,
    String author
  ) async {
    noteUpdateNote(content, author);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset noteSetClobSlot(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setClobSlot = (NoteAutoSetClobSlotRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteSetClobSlot", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteSetClobSlotCall(
    BuffersData data
  ) async {
    noteSetClobSlot(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset noteGetClobSlot(
  ) {
    
    var el = NoteAutoCall()
      ..getClobSlot = noteWithNoteAutoHandle;    
       
     

    // final c = NoteDefs.CLOB_SLOT.value;
    final c = PosterDomainDefs.noteClobSlot.index;
    pushCall("noteGetClobSlot", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersData> noteGetClobSlotCall(
  ) async {
    noteGetClobSlot();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset noteGetAttachmentsSlot(
  ) {
    
    var el = NoteAutoCall()
      ..getAttachmentsSlot = noteWithNoteAutoHandle;    
       
     

    // final c = NoteDefs.ATTACHMENTS_SLOT.value;
    final c = PosterDomainDefs.noteAttachmentsSlot.index;
    pushCall("noteGetAttachmentsSlot", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersData> noteGetAttachmentsSlotCall(
  ) async {
    noteGetAttachmentsSlot();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset noteUpdateNoteContent(
    String content
  ) {
    
    var el = NoteAutoCall()
      ..updateNoteContent = (NoteAutoUpdateNoteContentRequest()
        ..handle = noteWithNoteAutoHandle
        ..content = content       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteUpdateNoteContent", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteUpdateNoteContentCall(
    String content
  ) async {
    noteUpdateNoteContent(content);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset noteSetImagesSlot(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setImagesSlot = (NoteAutoSetImagesSlotRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteSetImagesSlot", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteSetImagesSlotCall(
    BuffersData data
  ) async {
    noteSetImagesSlot(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset notePersistSlotsExistent(
  ) {
    
    var el = NoteAutoCall()
      ..persistSlotsExistent = noteWithNoteAutoHandle;    
       
     

    // final c = NoteDefs.AVAILABLE_PERSIST_SLOTS.value;
    final c = PosterDomainDefs.noteAvailablePersistSlots.index;
    pushCall("notePersistSlotsExistent", "NoteAuto", note, el, c);
    return this;
  }

  Future<StructData> notePersistSlotsExistentCall(
  ) async {
    notePersistSlotsExistent();
    var result= await dispatch();
    return StructData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset notePersistSlotValues(
  ) {
    
    var el = NoteAutoCall()
      ..persistSlotValues = noteWithNoteAutoHandle;    
       
     

    // final c = NoteDefs.PERSIST_SLOTS.value;
    final c = PosterDomainDefs.notePersistSlots.index;
    pushCall("notePersistSlotValues", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersMap> notePersistSlotValuesCall(
  ) async {
    notePersistSlotValues();
    var result= await dispatch();
    return BuffersMap.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset noteSetAttachmentsSlot(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setAttachmentsSlot = (NoteAutoSetAttachmentsSlotRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteSetAttachmentsSlot", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteSetAttachmentsSlotCall(
    BuffersData data
  ) async {
    noteSetAttachmentsSlot(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset noteGetNote(
  ) {
    
    var el = NoteAutoCall()
      ..getNote = noteWithNoteAutoHandle;    
       
     

    // final c = NoteDefs.NOTE.value;
    final c = PosterDomainDefs.noteNote.index;
    pushCall("noteGetNote", "NoteAuto", note, el, c);
    return this;
  }

  Future<NoteProto> noteGetNoteCall(
  ) async {
    noteGetNote();
    var result= await dispatch();
    return NoteProto.fromBuffer(result.values.last.slotData);
  }

          
     
  
  NoteCoHandle get noteWithNoteCoHandle {
    return NoteCoHandle()
      ..regionId = note.regionId
      ..bundleId = note.id;
  }     

     
  PosterPreset noteGetNoteProto(
  ) {
    
    var el = NoteCoCall()
      ..getNoteProto = noteWithNoteCoHandle;    
       
     

    // final c = NoteDefs.DEFAULT_DOMAIN.value;
    final c = PosterDomainDefs.noteDefaultDomain.index;
    pushCall("noteGetNoteProto", "NoteCo", note, el, c);
    return this;
  }

  Future<NoteProto> noteGetNoteProtoCall(
  ) async {
    noteGetNoteProto();
    var result= await dispatch();
    return NoteProto.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset noteRevokeContent(
  ) {
    
    var el = NoteCoCall()
      ..revokeContent = noteWithNoteCoHandle;    
       
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteRevokeContent", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteRevokeContentCall(
  ) async {
    noteRevokeContent();
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset noteSetContent(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContent = (NoteCoSetContentRequest()
        ..handle = noteWithNoteCoHandle
        ..cnt = cnt       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteSetContent", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteSetContentCall(
    String cnt
  ) async {
    noteSetContent(cnt);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset noteSetContentComp(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContentComp = (NoteCoSetContentCompRequest()
        ..handle = noteWithNoteCoHandle
        ..cnt = cnt       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteSetContentComp", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteSetContentCompCall(
    String cnt
  ) async {
    noteSetContentComp(cnt);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset noteGetContent(
  ) {
    
    var el = NoteCoCall()
      ..getContent = noteWithNoteCoHandle;    
       
     

    // final c = NoteDefs.CONTENT.value;
    final c = PosterDomainDefs.noteContent.index;
    pushCall("noteGetContent", "NoteCo", note, el, c);
    return this;
  }

  Future<StringValue> noteGetContentCall(
  ) async {
    noteGetContent();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset noteName(
  ) {
    
    var el = NoteCoCall()
      ..name = noteWithNoteCoHandle;    
       
     

    // final c = NoteDefs.TITLE.value;
    final c = PosterDomainDefs.noteTitle.index;
    pushCall("noteName", "NoteCo", note, el, c);
    return this;
  }

  Future<StringValue> noteNameCall(
  ) async {
    noteName();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

          
     
  
  WhiteBoardHandle get memoWithWhiteBoardHandle {
    return WhiteBoardHandle()
      ..regionId = memo.regionId
      ..bundleId = memo.id;
  }     

     
  PosterPreset memoGetImagesSlot(
  ) {
    
    var el = WhiteBoardCall()
      ..getImagesSlot = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.IMAGES_SLOT.value;
    final c = PosterDomainDefs.memoImagesSlot.index;
    pushCall("memoGetImagesSlot", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetImagesSlotCall(
  ) async {
    memoGetImagesSlot();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoGetLastAuthor(
  ) {
    
    var el = WhiteBoardCall()
      ..getLastAuthor = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.LAST_AUTHOR.value;
    final c = PosterDomainDefs.memoLastAuthor.index;
    pushCall("memoGetLastAuthor", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<StringValue> memoGetLastAuthorCall(
  ) async {
    memoGetLastAuthor();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoUpdateNote(
    String content,
    String author
  ) {
    
    var el = WhiteBoardCall()
      ..updateNote = (WhiteBoardUpdateNoteRequest()
        ..handle = memoWithWhiteBoardHandle
        ..content = content
        ..author = author       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoUpdateNote", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoUpdateNoteCall(
    String content,
    String author
  ) async {
    memoUpdateNote(content, author);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset memoSetClobSlot(
    BuffersData data
  ) {
    
    var el = WhiteBoardCall()
      ..setClobSlot = (WhiteBoardSetClobSlotRequest()
        ..handle = memoWithWhiteBoardHandle
        ..data = data       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoSetClobSlot", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoSetClobSlotCall(
    BuffersData data
  ) async {
    memoSetClobSlot(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset memoUpdateNoteContent(
    String content
  ) {
    
    var el = WhiteBoardCall()
      ..updateNoteContent = (WhiteBoardUpdateNoteContentRequest()
        ..handle = memoWithWhiteBoardHandle
        ..content = content       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoUpdateNoteContent", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoUpdateNoteContentCall(
    String content
  ) async {
    memoUpdateNoteContent(content);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset memoSetImagesSlot(
    BuffersData data
  ) {
    
    var el = WhiteBoardCall()
      ..setImagesSlot = (WhiteBoardSetImagesSlotRequest()
        ..handle = memoWithWhiteBoardHandle
        ..data = data       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoSetImagesSlot", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoSetImagesSlotCall(
    BuffersData data
  ) async {
    memoSetImagesSlot(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset memoPutContent(
    String content,
    String partyId
  ) {
    
    var el = WhiteBoardCall()
      ..putContent = (WhiteBoardPutContentRequest()
        ..handle = memoWithWhiteBoardHandle
        ..content = content
        ..partyId = partyId       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoPutContent", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoPutContentCall(
    String content,
    String partyId
  ) async {
    memoPutContent(content, partyId);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset memoPersistSlotsExistent(
  ) {
    
    var el = WhiteBoardCall()
      ..persistSlotsExistent = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.AVAILABLE_PERSIST_SLOTS.value;
    final c = PosterDomainDefs.memoAvailablePersistSlots.index;
    pushCall("memoPersistSlotsExistent", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<StructData> memoPersistSlotsExistentCall(
  ) async {
    memoPersistSlotsExistent();
    var result= await dispatch();
    return StructData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoSetAttachmentsSlot(
    BuffersData data
  ) {
    
    var el = WhiteBoardCall()
      ..setAttachmentsSlot = (WhiteBoardSetAttachmentsSlotRequest()
        ..handle = memoWithWhiteBoardHandle
        ..data = data       
      );     
     

    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoSetAttachmentsSlot", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoSetAttachmentsSlotCall(
    BuffersData data
  ) async {
    memoSetAttachmentsSlot(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset memoGetContentAndAuthor(
  ) {
    
    var el = WhiteBoardCall()
      ..getContentAndAuthor = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.CONTENT_AND_AUTHOR.value;
    final c = PosterDomainDefs.memoContentAndAuthor.index;
    pushCall("memoGetContentAndAuthor", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<ContentAndAuthor> memoGetContentAndAuthorCall(
  ) async {
    memoGetContentAndAuthor();
    var result= await dispatch();
    return ContentAndAuthor.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoGetNote(
  ) {
    
    var el = WhiteBoardCall()
      ..getNote = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.NOTE.value;
    final c = PosterDomainDefs.memoNote.index;
    pushCall("memoGetNote", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<NoteProto> memoGetNoteCall(
  ) async {
    memoGetNote();
    var result= await dispatch();
    return NoteProto.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoGetClobSlot(
  ) {
    
    var el = WhiteBoardCall()
      ..getClobSlot = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.CLOB_SLOT.value;
    final c = PosterDomainDefs.memoClobSlot.index;
    pushCall("memoGetClobSlot", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetClobSlotCall(
  ) async {
    memoGetClobSlot();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoGetLastContent(
  ) {
    
    var el = WhiteBoardCall()
      ..getLastContent = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.LAST_CONTENT.value;
    final c = PosterDomainDefs.memoLastContent.index;
    pushCall("memoGetLastContent", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<StringValue> memoGetLastContentCall(
  ) async {
    memoGetLastContent();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoGetAttachmentsSlot(
  ) {
    
    var el = WhiteBoardCall()
      ..getAttachmentsSlot = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.ATTACHMENTS_SLOT.value;
    final c = PosterDomainDefs.memoAttachmentsSlot.index;
    pushCall("memoGetAttachmentsSlot", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetAttachmentsSlotCall(
  ) async {
    memoGetAttachmentsSlot();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoPersistSlotValues(
  ) {
    
    var el = WhiteBoardCall()
      ..persistSlotValues = memoWithWhiteBoardHandle;    
       
     

    // final c = NoteDefs.PERSIST_SLOTS.value;
    final c = PosterDomainDefs.memoPersistSlots.index;
    pushCall("memoPersistSlotValues", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<BuffersMap> memoPersistSlotValuesCall(
  ) async {
    memoPersistSlotValues();
    var result= await dispatch();
    return BuffersMap.fromBuffer(result.values.last.slotData);
  }

          
     
       

     
  PosterPreset fixturesOneNote(
  ) {
    
    var el= FixtureObjectsCall()
        ..oneNote=Empty.getDefault();    

         

    // final c = 0;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("fixturesOneNote", "FixtureObjects", fixtures, el, c);
    return this;
  }

  Future<XcRefId> fixturesOneNoteCall(
  ) async {
    fixturesOneNote();
    var result= await dispatch();
    return XcRefId.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset fixturesSomeNotes(
    int total
  ) {
    
    var el= FixtureObjectsCall()
        ..someNotes=Int32Value(value: total);    

         

    // final c = 0;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("fixturesSomeNotes", "FixtureObjects", fixtures, el, c);
    return this;
  }

  Future<Strings> fixturesSomeNotesCall(
    int total
  ) async {
    fixturesSomeNotes(total);
    var result= await dispatch();
    return Strings.fromBuffer(result.values.last.slotData);
  }

          
          
}




