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
import 'milestones_defs.dart';





class MilestonesPresetKeys extends Equatable {
  final String regionId;
  BundleKey get regionKey => BundleKey(regionId: regionId);
  final String? plId;
  BundleKey? get plKey => plId!=null?BundleKey(regionId: regionId, id: plId):null;
  final String todosId;
  BundleKey get todosKey => BundleKey(regionId: regionId, id: todosId);

  MilestonesPresetKeys({
    required this.todosId,
    this.plId,
    this.regionId='default'});

  static final empty = MilestonesPresetKeys(
      todosId: '',
  );

  factory MilestonesPresetKeys.fromMap(Map<String, String> keysMap){
    return MilestonesPresetKeys(
        todosId: keysMap['todosId']!,
        plId: keysMap['plId'],
        regionId: keysMap['regionId']??'default'
    );
  }

  factory MilestonesPresetKeys.fromMeta(CallBuilderContextProto meta){
    Map<String, BundleKey> keysMap = meta.keys;
    return MilestonesPresetKeys(
        todosId: keysMap['todos']!.id,
        plId: meta.plId,
        regionId: meta.regionId
    );
  }

  Map<String, String> get keys => {
    'todosId': todosId,
  };

  Map<String, BundleKey> get bundleKeys => {
    'todos': todosKey,
    'fixtures': regionKey,       
  };

  PresetManagerCreatePresetPlRequest asPlRequest(String tag, String owner){
    return PresetManagerCreatePresetPlRequest()
      ..regionId = regionId
      ..presetName = 'Milestones'
      ..owner = owner
      ..tag = tag
      ..keys = StringMap(values: keys);
  }

  CallBuilderContextProto asCallBuilderProto(String tag, String owner){
    return CallBuilderContextProto()
      ..regionId = regionId
      ..presetName = "Milestones"
      ..owner = owner
      ..tag = tag
      ..keys.addAll(bundleKeys);
  }

  @override
  List<Object?> get props => [
    regionId, 
    plId,
    todosId,
  ];
}

class MilestonesPreset extends PresetBase {
  final MilestonesPresetKeys keys;
  BundleKey get todos => keys.todosKey;
  BundleKey get fixtures => keys.regionKey;       

  MilestonesPreset(
      this.keys,
      {PresetDispatcherAgent? presetAgent})
      : super(presetAgent ?? XcClient().presetDispatcherAgent(),
            keys.plKey ?? BundleKey(regionId: 'default', id: slugId()));

  
  
  TodosHandle get todosWithTodosHandle {
    return TodosHandle()
      ..regionId = todos.regionId
      ..bundleId = todos.id;
  }     

     
  MilestonesPreset todosRemoveTodo(
    String assocId
  ) {
    
    var el = TodosCall()
      ..removeTodo = (TodosRemoveTodoRequest()
        ..handle = todosWithTodosHandle
        ..assocId = assocId       
      );     
     
    // final c = 0;
    final c = MilestonesDomainDefs.todosRemoveTodo.index;
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

     
  MilestonesPreset todosAddTodoById(
    String todoId
  ) {
    
    var el = TodosCall()
      ..addTodoById = (TodosAddTodoByIdRequest()
        ..handle = todosWithTodosHandle
        ..todoId = todoId       
      );     
     
    // final c = 0;
    final c = MilestonesDomainDefs.todosAddTodoById.index;
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

     
  MilestonesPreset todosUpdateTodo(
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
    final c = MilestonesDomainDefs.todosUpdateTodo.index;
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

     
  MilestonesPreset todosGetTodosProto(
  ) {
    
    var el = TodosCall()
      ..getTodosProto = todosWithTodosHandle;    
       
     
    // final c = 0;
    final c = MilestonesDomainDefs.todosDefaultDomain.index;
    pushCall("todosGetTodosProto", "Todos", todos, el, c);
    return this;
  }

  Future<TodosProto> todosGetTodosProtoCall(
  ) async {
    todosGetTodosProto();
    var result= await dispatch();
    return TodosProto.fromBuffer(result.values.last.slotData);
  }

     
  MilestonesPreset todosGetTodoProtoList(
  ) {
    
    var el = TodosCall()
      ..getTodoProtoList = todosWithTodosHandle;    
       
     
    // final c = 0;
    final c = MilestonesDomainDefs.todosGetTodoProtoList.index;
    pushCall("todosGetTodoProtoList", "Todos", todos, el, c);
    return this;
  }

  Future<TodoProtoList> todosGetTodoProtoListCall(
  ) async {
    todosGetTodoProtoList();
    var result= await dispatch();
    return TodoProtoList.fromBuffer(result.values.last.slotData);
  }

     
  MilestonesPreset todosAddTodo(
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
    final c = MilestonesDomainDefs.todosAddTodo.index;
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

     
  MilestonesPreset todosGetPercentComplete(
  ) {
    
    var el = TodosCall()
      ..getPercentComplete = todosWithTodosHandle;    
       
     
    // final c = 0;
    final c = MilestonesDomainDefs.todosPercentComplete.index;
    pushCall("todosGetPercentComplete", "Todos", todos, el, c);
    return this;
  }

  Future<Int64Value> todosGetPercentCompleteCall(
  ) async {
    todosGetPercentComplete();
    var result= await dispatch();
    return Int64Value.fromBuffer(result.values.last.slotData);
  }

     
  MilestonesPreset todosMarkComplete(
    String assocId
  ) {
    
    var el = TodosCall()
      ..markComplete = (TodosMarkCompleteRequest()
        ..handle = todosWithTodosHandle
        ..assocId = assocId       
      );     
     
    // final c = 0;
    final c = MilestonesDomainDefs.todosMarkComplete.index;
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

          
  
       

     
  MilestonesPreset fixturesOneNote(
  ) {
    
    var el= FixtureObjectsCall()
        ..oneNote=Empty.getDefault();    

         
    // final c = 0;
    final c = MilestonesDomainDefs.nonDomainField.index;
    pushCall("fixturesOneNote", "FixtureObjects", fixtures, el, c);
    return this;
  }

  Future<XcRefId> fixturesOneNoteCall(
  ) async {
    fixturesOneNote();
    var result= await dispatch();
    return XcRefId.fromBuffer(result.values.last.slotData);
  }

     
  MilestonesPreset fixturesSomeNotes(
    int total
  ) {
    
    var el= FixtureObjectsCall()
        ..someNotes=Int32Value(value: total);    

         
    // final c = 0;
    final c = MilestonesDomainDefs.nonDomainField.index;
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




