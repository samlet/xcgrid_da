import 'package:protobuf/protobuf.dart';
import 'package:equatable/equatable.dart';

import '../../common_proto.dart';
// import '../agent/preset_manager.dart';
import '../agent/preset_dispatcher.dart';
import '../generated/call_builder.pb.dart';
import '../generated/preset_manager.pb.dart';
import '../preset_base.dart';
import '../xcrpc_client.dart';

import '../generated/note_domain.pb.dart';
import '../generated/workeff_domain.pb.dart';

import '../generated/note_co.pbgrpc.dart';
import '../generated/note_auto.pb.dart';
import '../generated/domain/note_defs.pbenum.dart';

import '../generated/white_board.pb.dart';
import '../generated/todos.pb.dart';

import '../generated/fixture_objects.pb.dart';
import '../generated/pipelines.pb.dart';
import '../generated/merchant_on_chain.pb.dart';

import '../util.dart';
import 'poster_defs.dart';





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
        plId: meta.plId,
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

  
  
  NoteAutoHandle get noteWithNoteAutoHandle {
    return NoteAutoHandle()
      ..regionId = note.regionId
      ..bundleId = note.id;
  }     

     
  PosterPreset noteGetAttachments(
  ) {
    
    var el = NoteAutoCall()
      ..getAttachments = noteWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.ATTACHMENTS.value;
    final c = PosterDomainDefs.noteAttachments.index;
    pushCall("noteGetAttachments", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersData> noteGetAttachmentsCall(
  ) async {
    noteGetAttachments();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset noteSetAttachments(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setAttachments = (NoteAutoSetAttachmentsRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteSetAttachments", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteSetAttachmentsCall(
    BuffersData data
  ) async {
    noteSetAttachments(data);
    await dispatch();
    return Empty.getDefault();
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

     
  PosterPreset noteSetClob(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setClob = (NoteAutoSetClobRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteSetClob", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteSetClobCall(
    BuffersData data
  ) async {
    noteSetClob(data);
    await dispatch();
    return Empty.getDefault();
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

     
  PosterPreset noteGetClob(
  ) {
    
    var el = NoteAutoCall()
      ..getClob = noteWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.CLOB.value;
    final c = PosterDomainDefs.noteClob.index;
    pushCall("noteGetClob", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersData> noteGetClobCall(
  ) async {
    noteGetClob();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset noteSetImages(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setImages = (NoteAutoSetImagesRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("noteSetImages", "NoteAuto", note, el, c);
    return this;
  }

  Future<Empty> noteSetImagesCall(
    BuffersData data
  ) async {
    noteSetImages(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset noteGetImages(
  ) {
    
    var el = NoteAutoCall()
      ..getImages = noteWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.IMAGES.value;
    final c = PosterDomainDefs.noteImages.index;
    pushCall("noteGetImages", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersData> noteGetImagesCall(
  ) async {
    noteGetImages();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
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

     
  PosterPreset memoSetAttachments(
    BuffersData data
  ) {
    
    var el = WhiteBoardCall()
      ..setAttachments = (WhiteBoardSetAttachmentsRequest()
        ..handle = memoWithWhiteBoardHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoSetAttachments", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoSetAttachmentsCall(
    BuffersData data
  ) async {
    memoSetAttachments(data);
    await dispatch();
    return Empty.getDefault();
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

     
  PosterPreset memoGetClob(
  ) {
    
    var el = WhiteBoardCall()
      ..getClob = memoWithWhiteBoardHandle;    
       
     
    // final c = NoteDefs.CLOB.value;
    final c = PosterDomainDefs.memoClob.index;
    pushCall("memoGetClob", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetClobCall(
  ) async {
    memoGetClob();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  PosterPreset memoGetAttachments(
  ) {
    
    var el = WhiteBoardCall()
      ..getAttachments = memoWithWhiteBoardHandle;    
       
     
    // final c = NoteDefs.ATTACHMENTS.value;
    final c = PosterDomainDefs.memoAttachments.index;
    pushCall("memoGetAttachments", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetAttachmentsCall(
  ) async {
    memoGetAttachments();
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

     
  PosterPreset memoSetClob(
    BuffersData data
  ) {
    
    var el = WhiteBoardCall()
      ..setClob = (WhiteBoardSetClobRequest()
        ..handle = memoWithWhiteBoardHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoSetClob", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoSetClobCall(
    BuffersData data
  ) async {
    memoSetClob(data);
    await dispatch();
    return Empty.getDefault();
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

     
  PosterPreset memoSetImages(
    BuffersData data
  ) {
    
    var el = WhiteBoardCall()
      ..setImages = (WhiteBoardSetImagesRequest()
        ..handle = memoWithWhiteBoardHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = PosterDomainDefs.nonDomainField.index;
    pushCall("memoSetImages", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<Empty> memoSetImagesCall(
    BuffersData data
  ) async {
    memoSetImages(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  PosterPreset memoGetImages(
  ) {
    
    var el = WhiteBoardCall()
      ..getImages = memoWithWhiteBoardHandle;    
       
     
    // final c = NoteDefs.IMAGES.value;
    final c = PosterDomainDefs.memoImages.index;
    pushCall("memoGetImages", "WhiteBoard", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetImagesCall(
  ) async {
    memoGetImages();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
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




