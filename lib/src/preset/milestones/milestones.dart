import 'package:xcgrid_da/preset_common.dart';
import '../../generated/call_builder.pb.dart';
import '../../generated/workeff_domain.pb.dart';
import '../../generated/extra/common_slot.pb.dart';
import '../../generated/work_effort.pb.dart';
import '../../generated/todos_handle.pb.dart';
import '../../generated/fixture_objects.pb.dart';
import '../../generated/preset_manager.pb.dart';
import '../../generated/todos.pb.dart';

part 'milestones_defs.dart';
part 'milestones_loader.dart';
part 'milestones_repository.dart';

// for domain
part 'milestones_state.dart';
part 'milestones_cubit.dart';

// for list
part 'milestones_todo_list_state.dart';
part 'milestones_todos__todo_list_cubit.dart';

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
        plId: meta.plXid.bundleId,
        regionId: meta.regionId
    );
  }

  Map<String, String> get keys => {
    'todosId': todosId,
  };

  Map<String, BundleKey> get bundleKeys => {
    'todos': todosKey,
    'fixtures': regionKey,
    'psm': regionKey,       
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
  BundleKey get psm => keys.regionKey;       

  MilestonesPreset(
      this.keys,
      {PresetDispatcherAgent? presetAgent})
      : super(presetAgent ?? XcClient().presetDispatcherAgent(),
            keys.plKey ?? BundleKey(regionId: 'default', id: slugId()));

  MilestonesPreset saga(){
    currentState=BuilderState.bsSaga;
    return this;
  }

     
  
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

     
  MilestonesPreset todosGetWorkEffort(
  ) {
    
    var el = TodosCall()
      ..getWorkEffort = todosWithTodosHandle;    
       
     

    // final c = 0;
    final c = MilestonesDomainDefs.todosWorkEffort.index;
    pushCall("todosGetWorkEffort", "Todos", todos, el, c);
    return this;
  }

  Future<WorkEffortProto> todosGetWorkEffortCall(
  ) async {
    todosGetWorkEffort();
    var result= await dispatch();
    return WorkEffortProto.fromBuffer(result.values.last.slotData);
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

          
     
       

     
  MilestonesPreset psmLoadPresetMeta(
    String plId
  ) {
    
    var el= PresetManagerCall()
        ..loadPresetMeta=StringValue(value: plId);    

         

    // final c = 0;
    final c = MilestonesDomainDefs.nonDomainField.index;
    pushCall("psmLoadPresetMeta", "PresetManager", psm, el, c);
    return this;
  }

  Future<CallBuilderContextProto> psmLoadPresetMetaCall(
    String plId
  ) async {
    psmLoadPresetMeta(plId);
    var result= await dispatch();
    return CallBuilderContextProto.fromBuffer(result.values.last.slotData);
  }

     
  MilestonesPreset psmGetPlIdByOwnerAndTag(
    String regionId,
    String owner,
    String tag
  ) {
    
    
    var el = PresetManagerCall()
      ..getPlIdByOwnerAndTag = (PresetManagerGetPlIdByOwnerAndTagRequest()
        ..regionId = regionId
        ..owner = owner
        ..tag = tag       
      );     
    

         

    // final c = 0;
    final c = MilestonesDomainDefs.nonDomainField.index;
    pushCall("psmGetPlIdByOwnerAndTag", "PresetManager", psm, el, c);
    return this;
  }

  Future<IdOrErr> psmGetPlIdByOwnerAndTagCall(
    String regionId,
    String owner,
    String tag
  ) async {
    psmGetPlIdByOwnerAndTag(regionId, owner, tag);
    var result= await dispatch();
    return IdOrErr.fromBuffer(result.values.last.slotData);
  }

          
          
}




