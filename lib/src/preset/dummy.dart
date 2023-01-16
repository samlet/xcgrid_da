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
import 'dummy_defs.dart';





class DummyPresetKeys extends Equatable {
  final String regionId;
  BundleKey get regionKey => BundleKey(regionId: regionId);
  final String? plId;
  BundleKey? get plKey => plId!=null?BundleKey(regionId: regionId, id: plId):null;
  final String noteId;
  BundleKey get noteKey => BundleKey(regionId: regionId, id: noteId);
  final String memoId;
  BundleKey get memoKey => BundleKey(regionId: regionId, id: memoId);
  final String todosId;
  BundleKey get todosKey => BundleKey(regionId: regionId, id: todosId);

  DummyPresetKeys({
    required this.noteId,
    required this.memoId,
    required this.todosId,
    this.plId,
    this.regionId='default'});

  static final empty = DummyPresetKeys(
      noteId: '',
      memoId: '',
      todosId: '',
  );

  factory DummyPresetKeys.fromMap(Map<String, String> keysMap){
    return DummyPresetKeys(
        noteId: keysMap['noteId']!,
        memoId: keysMap['memoId']!,
        todosId: keysMap['todosId']!,
        plId: keysMap['plId'],
        regionId: keysMap['regionId']??'default'
    );
  }

  factory DummyPresetKeys.fromMeta(CallBuilderContextProto meta){
    Map<String, BundleKey> keysMap = meta.keys;
    return DummyPresetKeys(
        noteId: keysMap['note']!.id,
        memoId: keysMap['memo']!.id,
        todosId: keysMap['todos']!.id,
        plId: meta.plId,
        regionId: meta.regionId
    );
  }

  Map<String, String> get keys => {
    'noteId': noteId,
    'memoId': memoId,
    'todosId': todosId,
  };

  Map<String, BundleKey> get bundleKeys => {
    'note': noteKey,
    'memo': memoKey,
    'todos': todosKey,
    'pls': regionKey,
    'merchant': regionKey,
    'fixtures': regionKey,       
  };

  PresetManagerCreatePresetPlRequest asPlRequest(String tag, String owner){
    return PresetManagerCreatePresetPlRequest()
      ..regionId = regionId
      ..presetName = 'Dummy'
      ..owner = owner
      ..tag = tag
      ..keys = StringMap(values: keys);
  }

  CallBuilderContextProto asCallBuilderProto(String tag, String owner){
    return CallBuilderContextProto()
      ..regionId = regionId
      ..presetName = "Dummy"
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
    todosId,
  ];
}

class DummyPreset extends PresetBase {
  final DummyPresetKeys keys;
  BundleKey get note => keys.noteKey;
  BundleKey get memo => keys.memoKey;
  BundleKey get todos => keys.todosKey;
  BundleKey get pls => keys.regionKey;
  BundleKey get merchant => keys.regionKey;
  BundleKey get fixtures => keys.regionKey;       

  DummyPreset(
      this.keys,
      {PresetDispatcherAgent? presetAgent})
      : super(presetAgent ?? XcClient().presetDispatcherAgent(),
            keys.plKey ?? BundleKey(regionId: 'default', id: slugId()));

  
  
  NoteAutoHandle get noteWithNoteAutoHandle {
    return NoteAutoHandle()
      ..regionId = note.regionId
      ..bundleId = note.id;
  }     

     
  DummyPreset noteGetAttachments(
  ) {
    
    var el = NoteAutoCall()
      ..getAttachments = noteWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.ATTACHMENTS.value;
    final c = DummyDomainDefs.noteAttachments.index;
    pushCall("noteGetAttachments", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersData> noteGetAttachmentsCall(
  ) async {
    noteGetAttachments();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset noteSetAttachments(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setAttachments = (NoteAutoSetAttachmentsRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
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

     
  DummyPreset noteUpdateNote(
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
    final c = DummyDomainDefs.nonDomainField.index;
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

     
  DummyPreset noteSetClob(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setClob = (NoteAutoSetClobRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
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

     
  DummyPreset noteUpdateNoteContent(
    String content
  ) {
    
    var el = NoteAutoCall()
      ..updateNoteContent = (NoteAutoUpdateNoteContentRequest()
        ..handle = noteWithNoteAutoHandle
        ..content = content       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
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

     
  DummyPreset notePersistSlotsExistent(
  ) {
    
    var el = NoteAutoCall()
      ..persistSlotsExistent = noteWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.AVAILABLE_PERSIST_SLOTS.value;
    final c = DummyDomainDefs.noteAvailablePersistSlots.index;
    pushCall("notePersistSlotsExistent", "NoteAuto", note, el, c);
    return this;
  }

  Future<StructData> notePersistSlotsExistentCall(
  ) async {
    notePersistSlotsExistent();
    var result= await dispatch();
    return StructData.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset notePersistSlotValues(
  ) {
    
    var el = NoteAutoCall()
      ..persistSlotValues = noteWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.PERSIST_SLOTS.value;
    final c = DummyDomainDefs.notePersistSlots.index;
    pushCall("notePersistSlotValues", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersMap> notePersistSlotValuesCall(
  ) async {
    notePersistSlotValues();
    var result= await dispatch();
    return BuffersMap.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset noteGetClob(
  ) {
    
    var el = NoteAutoCall()
      ..getClob = noteWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.CLOB.value;
    final c = DummyDomainDefs.noteClob.index;
    pushCall("noteGetClob", "NoteAuto", note, el, c);
    return this;
  }

  Future<BuffersData> noteGetClobCall(
  ) async {
    noteGetClob();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset noteSetImages(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setImages = (NoteAutoSetImagesRequest()
        ..handle = noteWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
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

     
  DummyPreset noteGetImages(
  ) {
    
    var el = NoteAutoCall()
      ..getImages = noteWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.IMAGES.value;
    final c = DummyDomainDefs.noteImages.index;
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

     
  DummyPreset noteGetNoteProto(
  ) {
    
    var el = NoteCoCall()
      ..getNoteProto = noteWithNoteCoHandle;    
       
     
    // final c = NoteDefs.DEFAULT_DOMAIN.value;
    final c = DummyDomainDefs.noteDefaultDomain.index;
    pushCall("noteGetNoteProto", "NoteCo", note, el, c);
    return this;
  }

  Future<NoteProto> noteGetNoteProtoCall(
  ) async {
    noteGetNoteProto();
    var result= await dispatch();
    return NoteProto.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset noteRevokeContent(
  ) {
    
    var el = NoteCoCall()
      ..revokeContent = noteWithNoteCoHandle;    
       
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("noteRevokeContent", "NoteCo", note, el, c);
    return this;
  }

  Future<Empty> noteRevokeContentCall(
  ) async {
    noteRevokeContent();
    await dispatch();
    return Empty.getDefault();
  }

     
  DummyPreset noteSetContent(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContent = (NoteCoSetContentRequest()
        ..handle = noteWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
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

     
  DummyPreset noteSetContentComp(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContentComp = (NoteCoSetContentCompRequest()
        ..handle = noteWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
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

     
  DummyPreset noteGetContent(
  ) {
    
    var el = NoteCoCall()
      ..getContent = noteWithNoteCoHandle;    
       
     
    // final c = NoteDefs.CONTENT.value;
    final c = DummyDomainDefs.noteContent.index;
    pushCall("noteGetContent", "NoteCo", note, el, c);
    return this;
  }

  Future<StringValue> noteGetContentCall(
  ) async {
    noteGetContent();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset noteName(
  ) {
    
    var el = NoteCoCall()
      ..name = noteWithNoteCoHandle;    
       
     
    // final c = NoteDefs.TITLE.value;
    final c = DummyDomainDefs.noteTitle.index;
    pushCall("noteName", "NoteCo", note, el, c);
    return this;
  }

  Future<StringValue> noteNameCall(
  ) async {
    noteName();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

          
  
  
  NoteAutoHandle get memoWithNoteAutoHandle {
    return NoteAutoHandle()
      ..regionId = memo.regionId
      ..bundleId = memo.id;
  }     

     
  DummyPreset memoGetAttachments(
  ) {
    
    var el = NoteAutoCall()
      ..getAttachments = memoWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.ATTACHMENTS.value;
    final c = DummyDomainDefs.memoAttachments.index;
    pushCall("memoGetAttachments", "NoteAuto", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetAttachmentsCall(
  ) async {
    memoGetAttachments();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset memoSetAttachments(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setAttachments = (NoteAutoSetAttachmentsRequest()
        ..handle = memoWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("memoSetAttachments", "NoteAuto", memo, el, c);
    return this;
  }

  Future<Empty> memoSetAttachmentsCall(
    BuffersData data
  ) async {
    memoSetAttachments(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  DummyPreset memoUpdateNote(
    String content,
    String author
  ) {
    
    var el = NoteAutoCall()
      ..updateNote = (NoteAutoUpdateNoteRequest()
        ..handle = memoWithNoteAutoHandle
        ..content = content
        ..author = author       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("memoUpdateNote", "NoteAuto", memo, el, c);
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

     
  DummyPreset memoSetClob(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setClob = (NoteAutoSetClobRequest()
        ..handle = memoWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("memoSetClob", "NoteAuto", memo, el, c);
    return this;
  }

  Future<Empty> memoSetClobCall(
    BuffersData data
  ) async {
    memoSetClob(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  DummyPreset memoUpdateNoteContent(
    String content
  ) {
    
    var el = NoteAutoCall()
      ..updateNoteContent = (NoteAutoUpdateNoteContentRequest()
        ..handle = memoWithNoteAutoHandle
        ..content = content       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("memoUpdateNoteContent", "NoteAuto", memo, el, c);
    return this;
  }

  Future<Empty> memoUpdateNoteContentCall(
    String content
  ) async {
    memoUpdateNoteContent(content);
    await dispatch();
    return Empty.getDefault();
  }

     
  DummyPreset memoPersistSlotsExistent(
  ) {
    
    var el = NoteAutoCall()
      ..persistSlotsExistent = memoWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.AVAILABLE_PERSIST_SLOTS.value;
    final c = DummyDomainDefs.memoAvailablePersistSlots.index;
    pushCall("memoPersistSlotsExistent", "NoteAuto", memo, el, c);
    return this;
  }

  Future<StructData> memoPersistSlotsExistentCall(
  ) async {
    memoPersistSlotsExistent();
    var result= await dispatch();
    return StructData.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset memoPersistSlotValues(
  ) {
    
    var el = NoteAutoCall()
      ..persistSlotValues = memoWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.PERSIST_SLOTS.value;
    final c = DummyDomainDefs.memoPersistSlots.index;
    pushCall("memoPersistSlotValues", "NoteAuto", memo, el, c);
    return this;
  }

  Future<BuffersMap> memoPersistSlotValuesCall(
  ) async {
    memoPersistSlotValues();
    var result= await dispatch();
    return BuffersMap.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset memoGetClob(
  ) {
    
    var el = NoteAutoCall()
      ..getClob = memoWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.CLOB.value;
    final c = DummyDomainDefs.memoClob.index;
    pushCall("memoGetClob", "NoteAuto", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetClobCall(
  ) async {
    memoGetClob();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset memoSetImages(
    BuffersData data
  ) {
    
    var el = NoteAutoCall()
      ..setImages = (NoteAutoSetImagesRequest()
        ..handle = memoWithNoteAutoHandle
        ..data = data       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("memoSetImages", "NoteAuto", memo, el, c);
    return this;
  }

  Future<Empty> memoSetImagesCall(
    BuffersData data
  ) async {
    memoSetImages(data);
    await dispatch();
    return Empty.getDefault();
  }

     
  DummyPreset memoGetImages(
  ) {
    
    var el = NoteAutoCall()
      ..getImages = memoWithNoteAutoHandle;    
       
     
    // final c = NoteDefs.IMAGES.value;
    final c = DummyDomainDefs.memoImages.index;
    pushCall("memoGetImages", "NoteAuto", memo, el, c);
    return this;
  }

  Future<BuffersData> memoGetImagesCall(
  ) async {
    memoGetImages();
    var result= await dispatch();
    return BuffersData.fromBuffer(result.values.last.slotData);
  }

          
  
  
  NoteCoHandle get memoWithNoteCoHandle {
    return NoteCoHandle()
      ..regionId = memo.regionId
      ..bundleId = memo.id;
  }     

     
  DummyPreset memoGetNoteProto(
  ) {
    
    var el = NoteCoCall()
      ..getNoteProto = memoWithNoteCoHandle;    
       
     
    // final c = NoteDefs.DEFAULT_DOMAIN.value;
    final c = DummyDomainDefs.memoDefaultDomain.index;
    pushCall("memoGetNoteProto", "NoteCo", memo, el, c);
    return this;
  }

  Future<NoteProto> memoGetNoteProtoCall(
  ) async {
    memoGetNoteProto();
    var result= await dispatch();
    return NoteProto.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset memoRevokeContent(
  ) {
    
    var el = NoteCoCall()
      ..revokeContent = memoWithNoteCoHandle;    
       
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("memoRevokeContent", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoRevokeContentCall(
  ) async {
    memoRevokeContent();
    await dispatch();
    return Empty.getDefault();
  }

     
  DummyPreset memoSetContent(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContent = (NoteCoSetContentRequest()
        ..handle = memoWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("memoSetContent", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoSetContentCall(
    String cnt
  ) async {
    memoSetContent(cnt);
    await dispatch();
    return Empty.getDefault();
  }

     
  DummyPreset memoSetContentComp(
    String cnt
  ) {
    
    var el = NoteCoCall()
      ..setContentComp = (NoteCoSetContentCompRequest()
        ..handle = memoWithNoteCoHandle
        ..cnt = cnt       
      );     
     
    // final c = NoteDefs.NON_DOMAIN_FIELD.value;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("memoSetContentComp", "NoteCo", memo, el, c);
    return this;
  }

  Future<Empty> memoSetContentCompCall(
    String cnt
  ) async {
    memoSetContentComp(cnt);
    await dispatch();
    return Empty.getDefault();
  }

     
  DummyPreset memoGetContent(
  ) {
    
    var el = NoteCoCall()
      ..getContent = memoWithNoteCoHandle;    
       
     
    // final c = NoteDefs.CONTENT.value;
    final c = DummyDomainDefs.memoContent.index;
    pushCall("memoGetContent", "NoteCo", memo, el, c);
    return this;
  }

  Future<StringValue> memoGetContentCall(
  ) async {
    memoGetContent();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset memoName(
  ) {
    
    var el = NoteCoCall()
      ..name = memoWithNoteCoHandle;    
       
     
    // final c = NoteDefs.TITLE.value;
    final c = DummyDomainDefs.memoTitle.index;
    pushCall("memoName", "NoteCo", memo, el, c);
    return this;
  }

  Future<StringValue> memoNameCall(
  ) async {
    memoName();
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

          
  
  
  TodosHandle get todosWithTodosHandle {
    return TodosHandle()
      ..regionId = todos.regionId
      ..bundleId = todos.id;
  }     

     
  DummyPreset todosRemoveTodo(
    String assocId
  ) {
    
    var el = TodosCall()
      ..removeTodo = (TodosRemoveTodoRequest()
        ..handle = todosWithTodosHandle
        ..assocId = assocId       
      );     
     
    // final c = 0;
    final c = DummyDomainDefs.todosRemoveTodo.index;
    pushCall("todosRemoveTodo", "Todos", todos, el, c);
    return this;
  }

  Future<TodoProto> todosRemoveTodoCall(
    String assocId
  ) async {
    todosRemoveTodo(assocId);
    var result= await dispatch();
    return TodoProto.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset todosAddTodoById(
    String todoId
  ) {
    
    var el = TodosCall()
      ..addTodoById = (TodosAddTodoByIdRequest()
        ..handle = todosWithTodosHandle
        ..todoId = todoId       
      );     
     
    // final c = 0;
    final c = DummyDomainDefs.todosAddTodoById.index;
    pushCall("todosAddTodoById", "Todos", todos, el, c);
    return this;
  }

  Future<TodoProto> todosAddTodoByIdCall(
    String todoId
  ) async {
    todosAddTodoById(todoId);
    var result= await dispatch();
    return TodoProto.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset todosUpdateTodo(
    String assocId,
    String title,
    String description
  ) {
    
    var el = TodosCall()
      ..updateTodo = (TodosUpdateTodoRequest()
        ..handle = todosWithTodosHandle
        ..assocId = assocId
        ..title = title
        ..description = description       
      );     
     
    // final c = 0;
    final c = DummyDomainDefs.todosUpdateTodo.index;
    pushCall("todosUpdateTodo", "Todos", todos, el, c);
    return this;
  }

  Future<TodoProto> todosUpdateTodoCall(
    String assocId,
    String title,
    String description
  ) async {
    todosUpdateTodo(assocId, title, description);
    var result= await dispatch();
    return TodoProto.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset todosGetTodosProto(
  ) {
    
    var el = TodosCall()
      ..getTodosProto = todosWithTodosHandle;    
       
     
    // final c = 0;
    final c = DummyDomainDefs.todosDefaultDomain.index;
    pushCall("todosGetTodosProto", "Todos", todos, el, c);
    return this;
  }

  Future<TodosProto> todosGetTodosProtoCall(
  ) async {
    todosGetTodosProto();
    var result= await dispatch();
    return TodosProto.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset todosGetTodoProtoList(
  ) {
    
    var el = TodosCall()
      ..getTodoProtoList = todosWithTodosHandle;    
       
     
    // final c = 0;
    final c = DummyDomainDefs.todosGetTodoProtoList.index;
    pushCall("todosGetTodoProtoList", "Todos", todos, el, c);
    return this;
  }

  Future<TodoProtoList> todosGetTodoProtoListCall(
  ) async {
    todosGetTodoProtoList();
    var result= await dispatch();
    return TodoProtoList.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset todosAddTodo(
    String title,
    String description
  ) {
    
    var el = TodosCall()
      ..addTodo = (TodosAddTodoRequest()
        ..handle = todosWithTodosHandle
        ..title = title
        ..description = description       
      );     
     
    // final c = 0;
    final c = DummyDomainDefs.todosAddTodo.index;
    pushCall("todosAddTodo", "Todos", todos, el, c);
    return this;
  }

  Future<TodoProto> todosAddTodoCall(
    String title,
    String description
  ) async {
    todosAddTodo(title, description);
    var result= await dispatch();
    return TodoProto.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset todosGetPercentComplete(
  ) {
    
    var el = TodosCall()
      ..getPercentComplete = todosWithTodosHandle;    
       
     
    // final c = 0;
    final c = DummyDomainDefs.todosPercentComplete.index;
    pushCall("todosGetPercentComplete", "Todos", todos, el, c);
    return this;
  }

  Future<Int64Value> todosGetPercentCompleteCall(
  ) async {
    todosGetPercentComplete();
    var result= await dispatch();
    return Int64Value.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset todosMarkComplete(
    String assocId
  ) {
    
    var el = TodosCall()
      ..markComplete = (TodosMarkCompleteRequest()
        ..handle = todosWithTodosHandle
        ..assocId = assocId       
      );     
     
    // final c = 0;
    final c = DummyDomainDefs.todosMarkComplete.index;
    pushCall("todosMarkComplete", "Todos", todos, el, c);
    return this;
  }

  Future<TodoProto> todosMarkCompleteCall(
    String assocId
  ) async {
    todosMarkComplete(assocId);
    var result= await dispatch();
    return TodoProto.fromBuffer(result.values.last.slotData);
  }

          
  
       

     
  DummyPreset plsCreateArchivePl(
    String token,
    String assetName,
    String regionId,
    StructData bindArgs
  ) {
    
    
    var el = PipelinesCall()
      ..createArchivePl = (PipelinesCreateArchivePlRequest()
        ..token = token
        ..assetName = assetName
        ..regionId = regionId
        ..bindArgs = bindArgs       
      );     
    

         
    // final c = 0;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("plsCreateArchivePl", "Pipelines", pls, el, c);
    return this;
  }

  Future<StructData> plsCreateArchivePlCall(
    String token,
    String assetName,
    String regionId,
    StructData bindArgs
  ) async {
    plsCreateArchivePl(token, assetName, regionId, bindArgs);
    var result= await dispatch();
    return StructData.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset plsIsDone(
    String plId
  ) {
    
    var el= PipelinesCall()
        ..isDone=StringValue(value: plId);    

         
    // final c = 0;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("plsIsDone", "Pipelines", pls, el, c);
    return this;
  }

  Future<BoolValue> plsIsDoneCall(
    String plId
  ) async {
    plsIsDone(plId);
    var result= await dispatch();
    return BoolValue.fromBuffer(result.values.last.slotData);
  }

          
  
  
  ChainHandle get merchantWithMerchantOnChainHandle {
    return ChainHandle()
      ..regionId = merchant.regionId;
  }     

     
  DummyPreset merchantCreateMarketplace(
    FixedPoint totalSupply
  ) {
    
    var el = MerchantOnChainCall()
      ..createMarketplace = (MerchantOnChainCreateMarketplaceRequest()
        ..handle = merchantWithMerchantOnChainHandle
        ..totalSupply = totalSupply       
      );     
     
    // final c = 0;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("merchantCreateMarketplace", "MerchantOnChain", merchant, el, c);
    return this;
  }

  Future<StringValue> merchantCreateMarketplaceCall(
    FixedPoint totalSupply
  ) async {
    merchantCreateMarketplace(totalSupply);
    var result= await dispatch();
    return StringValue.fromBuffer(result.values.last.slotData);
  }

          
  
       

     
  DummyPreset fixturesSomeNotes(
    int total
  ) {
    
    var el= FixtureObjectsCall()
        ..someNotes=Int32Value(value: total);    

         
    // final c = 0;
    final c = DummyDomainDefs.nonDomainField.index;
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

     
  DummyPreset fixturesOneNote(
  ) {
    
    var el= FixtureObjectsCall()
        ..oneNote=Empty.getDefault();    

         
    // final c = 0;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("fixturesOneNote", "FixtureObjects", fixtures, el, c);
    return this;
  }

  Future<XcRefId> fixturesOneNoteCall(
  ) async {
    fixturesOneNote();
    var result= await dispatch();
    return XcRefId.fromBuffer(result.values.last.slotData);
  }

     
  DummyPreset fixturesEcho(
    StructData input
  ) {
    
    var el= FixtureObjectsCall()
        ..echo=input;    

         
    // final c = 0;
    final c = DummyDomainDefs.nonDomainField.index;
    pushCall("fixturesEcho", "FixtureObjects", fixtures, el, c);
    return this;
  }

  Future<StructData> fixturesEchoCall(
    StructData input
  ) async {
    fixturesEcho(input);
    var result= await dispatch();
    return StructData.fromBuffer(result.values.last.slotData);
  }

          
          
}




