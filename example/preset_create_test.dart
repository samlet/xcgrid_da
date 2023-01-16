import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';
import 'package:xcgrid_da/src/agent/preset_dispatcher.dart';
import 'package:xcgrid_da/src/agent/preset_manager.dart';
import 'package:xcgrid_da/src/bloc_util.dart';
import 'package:xcgrid_da/src/generated/domain/note_defs.pbenum.dart';
import 'package:xcgrid_da/src/generated/extra/common_slot.pb.dart';
import 'package:xcgrid_da/src/generated/google/protobuf/wrappers.pb.dart';
import 'package:xcgrid_da/src/generated/note_domain.pb.dart';
import 'package:xcgrid_da/src/generated/workeff_domain.pb.dart';
import 'package:xcgrid_da/src/preset/dummy.dart';
import 'package:xcgrid_da/src/preset/dummy_defs.dart';
import 'package:xcgrid_da/src/preset/dummy_loader.dart';
import 'package:xcgrid_da/src/preset_base.dart';
import 'package:xcgrid_da/src/preset_cubit.dart';
import 'package:xcgrid_da/src/xcrpc_client.dart';

Future<void> main(List<String> arguments) async {
  var pm = XcClient().presetDispatcherAgent();
  String tag = 'store:Demo';
  String owner = 'samlet';
  // Create or load preset-pipeline
  var plOr = await pm.client.createPresetPl(
      DummyPresetKeys(noteId: 'note_1', memoId: 'note_2', todosId: 'todos_1')
          .asCallBuilderProto(tag, owner));

  DummyPreset preset = await pm.loadDummyPreset(plOr);
  var cnt = await preset.memoSetContentComp('hi').memoGetNoteProtoCall();
  print('result -> ${cnt}');

  await testDispatch(preset);
  // await testCubit(pm);
  await testCubitWithList(pm);

  exit(0);
}

Future<void> testDispatch(DummyPreset preset) async {
  preset.memoSetContentComp('hi').memoGetContent().memoGetNoteProto();
  var slots = await preset.dispatch();
  processSlotList(slots);
}

void processSlotList(SlotList slots) {
  // var fldsMapper = {};
  // slots.values.where((element) => element.slotSeq != 0).forEach((element) {
  //   fldsMapper[element.slotSeq] = element.slotData;
  // });
  // fldsMapper[NoteDefs.CONTENT.value]??

  var wrapper = SlotsWrapper(slots);
  var state = NoteState().copyWith(status: NoteStatus.loading, slots: wrapper);
  print(state);
}

Future<void> testCubit(PresetDispatcherAgent pm) async {
  initBlocObserver();

  var cubit = NoteCubit(DummyRepository(pm));
  print("init: ${cubit.state}");

  var presetKeys =
      DummyPresetKeys(noteId: 'note_1', memoId: 'note_2', todosId: 'todos_1');
  await cubit.loadPreset(presetKeys, 'store:Demo', 'samlet');
  print("after load-preset: ${cubit.state}");
  await cubit.memoSetContent('hi, cubit');
  print("after set-cnt: ${cubit.state}");

  /// Close the `cubit` when it is no longer needed.
  cubit.close();
}

Future<void> testCubitWithList(PresetDispatcherAgent pm) async {
  initBlocObserver();

  var repos=DummyRepository(pm);
  var cubit = NoteCubit(repos);
  var listCubit=TodoListCubit(repository: repos);
  print("init: ${cubit.state}");

  var presetKeys =
  DummyPresetKeys(noteId: 'note_1', memoId: 'note_2', todosId: 'todos_1');
  await cubit.loadPreset(presetKeys, 'store:Demo', 'samlet');
  print("after load-preset: ${cubit.state}");
  await cubit.memoSetContent('hi, cubit');
  print("after set-cnt: ${cubit.state}");

  // await listCubit.todosGetTodoProtoList(); // 已经由事件触发自动加载
  sleep(const Duration(seconds: 1));
  print("state.items: ${listCubit.state}");

  /// Close the `cubit` when it is no longer needed.
  cubit.close();
}

abstract class PresetEvent {
  const PresetEvent();
}

class LoadDummyPresetKeysEvent extends PresetEvent {
  final DummyPresetKeys presetKeys;

  LoadDummyPresetKeysEvent(this.presetKeys);
}

class DummyRepository {
  final PresetDispatcherAgent presetAgent;
  DummyPreset? _preset;

  DummyRepository(this.presetAgent);

  final presetController = BehaviorSubject<PresetEvent>();

  Future<DummyPreset?> loadPreset(
      DummyPresetKeys presetKeys, String tag, String owner) async {
    if (_preset != null) return _preset;

    var requestKeys = presetKeys.asCallBuilderProto(tag, owner);
    var plOr = await presetAgent.client.createPresetPl(requestKeys);
    _preset = await presetAgent.loadDummyPreset(plOr);
    emit(LoadDummyPresetKeysEvent(_preset!.keys));
    return _preset;
  }

  void emit(PresetEvent e) {
    presetController.add(e);
  }
  void dispose() => presetController.close();
}

class NoteCubit extends PresetCubit<NoteState> {
  final DummyRepository presetRepository;
  @override
  DummyPreset? preset;

  // NoteCubit(super.initialState, super.presetAgent);
  NoteCubit(this.presetRepository)
      : super(NoteState(), presetRepository.presetAgent);

  Future<void> loadPreset(
      DummyPresetKeys presetKeys, String tag, String owner) async {
    // var requestKeys = presetKeys.asPlRequest(tag, owner);

    emit(state.copyWith(status: NoteStatus.loading));

    try {
      // Init preset
      // var plOr = await presetAgent.client.createPresetPl(requestKeys);
      // preset = await presetAgent.loadDummyPreset(plOr);
      preset = await presetRepository.loadPreset(presetKeys, tag, owner);

      // Init state with loaders
      preset!.memoGetContent().memoGetNoteProto();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);
      emit(state.copyWith(
          status: NoteStatus.success,
          presetKeys: preset!.keys,
          slots: wrapper));
    } on Exception {
      emit(state.copyWith(status: NoteStatus.failure));
    }
  }

  // Future<void> memoSetContent(String cnt) async {
  //   if (preset == null) return;
  //
  //   emit(state.copyWith(status: NoteStatus.loading));
  //   try {
  //     preset!.memoSetContent(cnt).memoGetContent().memoGetNoteProto();
  //     var slots = await preset!.dispatch();
  //     var wrapper = SlotsWrapper(slots);
  //     emit(state.copyWith(status: NoteStatus.success, slots: wrapper));
  //   } on Exception {
  //     emit(state.copyWith(status: NoteStatus.failure));
  //   }
  // }

  Future<void> memoSetContent(String cnt) async {
    await mut(() => preset!.memoSetContentComp(cnt).memoGetContent());
  }

  Future<void> mut(Function() builder) async {
    if (!state.status.isSuccess) return;
    if (preset == null) return;

    // emit(state.copyWith(status: NoteStatus.loading));
    try {
      // preset!.memoSetContent(cnt).memoGetContent().memoGetNoteProto();
      builder();
      var slots = await preset!.dispatch();
      var wrapper = SlotsWrapper(slots);
      // emit(state.copyWith(status: NoteStatus.success, slots: wrapper));
      emit(state.copyWith(slots: wrapper));
    } on Exception catch (e) {
      // emit(state.copyWith(status: NoteStatus.failure));
      print("fail: $e");
      emit(state);
    }
  }
}

enum NoteStatus { initial, loading, success, failure }

extension NoteStatusX on NoteStatus {
  bool get isInitial => this == NoteStatus.initial;

  bool get isLoading => this == NoteStatus.loading;

  bool get isSuccess => this == NoteStatus.success;

  bool get isFailure => this == NoteStatus.failure;
}

class NoteState extends Equatable {
  final NoteStatus status;
  final DummyPresetKeys presetKeys;

  final String content;

  // final String noteContent;
  final String title;
  final String author;

  // final List<int> bytes;

  // set contentAndAuthor(ContentAndAuthor)
  // set note(NoteProto proto)

  NoteState(
      {this.status = NoteStatus.initial,
      this.content = '',
      this.title = '',
      this.author = '',
      // this.bytes = const [],
      // ContentAndAuthor? contentAndAuthor,
      // NoteProto? note,
      DummyPresetKeys? presetKeys})
      : presetKeys = presetKeys ?? DummyPresetKeys.empty;

  // : contentAndAuthor = contentAndAuthor ?? ContentAndAuthor.getDefault(),
  //   note = note ?? NoteProto.getDefault();

  NoteState copyWith(
      {NoteStatus? status, DummyPresetKeys? presetKeys, SlotsWrapper? slots}) {
    String? content;
    String? title;
    String? author;

    // from complicated
    ContentAndAuthor? contentAndAuthor = slots?.asProto(
        NoteDefs.CONTENT_AND_AUTHOR.value, ContentAndAuthor.fromBuffer);
    // ContentAndAuthor? contentAndAuthor = slots?.asProto(
    //         DummyDefs.NOTE_CONTENT_AND_AUTHOR.value, ContentAndAuthor.fromBuffer);
    if (contentAndAuthor != null) {
      content = contentAndAuthor.content;
      author = contentAndAuthor.author;
    }

    NoteProto? note =
        slots?.asProto(NoteDefs.DEFAULT_DOMAIN.value, NoteProto.fromBuffer);
    if (note != null) {
      title = note.title;
      content = note.content;
      author = note.author;
    }

    // from scalar
    content = slots?.asString(NoteDefs.CONTENT.value) ?? content;
    // content = slots?.asString(DummyDomainDefs.noteContent.index) ?? content;
    title = slots?.asString(NoteDefs.TITLE.value) ?? title;

    return NoteState(
      status: status ?? this.status,
      presetKeys: presetKeys ?? this.presetKeys,

      content: content ?? this.content,
      title: title ?? this.title,
      author: author ?? this.author,
      // contentAndAuthor: slots?.asProto(NoteDefs.CONTENT_AND_AUTHOR.value,
      //         ContentAndAuthor.fromBuffer) ??
      //     this.contentAndAuthor,
      // note: slots?.asProto(
      //         NoteDefs.DEFAULT_DOMAIN.value, NoteProto.fromBuffer) ??
      //     this.note
    );
  }

  @override
  List<Object?> get props => [
        status, presetKeys, content, title, author
        // contentAndAuthor, note
      ];
}

// list muts --------

// TodoProto => TodoItem
class TodoItem extends Equatable {
  const TodoItem({
    required this.value,
    this.isDeleting = false,
  });

  String get id => value.itemId;
  final TodoProto value;
  final bool isDeleting;

  TodoItem copyWith({TodoProto? value, bool? isDeleting}) {
    return TodoItem(
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object> get props => [id, value, isDeleting];
}

enum TodoListStatus { loading, success, failure }

class TodoListState extends Equatable {
  const TodoListState._({
    this.status = TodoListStatus.loading,
    this.items = const <TodoItem>[],
  });

  const TodoListState.loading() : this._();

  const TodoListState.success(List<TodoItem> items)
      : this._(status: TodoListStatus.success, items: items);

  const TodoListState.failure() : this._(status: TodoListStatus.failure);

  final TodoListStatus status;
  final List<TodoItem> items;

  @override
  List<Object> get props => [status, items];
}

// 每个list-query一个cubit, 因为每个list-cubit实例都需要有自己的load状态.
// TodoProto => TodoListCubit
class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit({required this.repository})
      : super(const TodoListState.loading()) {
    _presetStatusSubscription = repository.presetController.listen((ev) {
      if (ev is LoadDummyPresetKeysEvent) {
        print("receive load-preset event: ${ev.presetKeys}");
        preset = DummyPreset(ev.presetKeys, presetAgent: repository.presetAgent);
        unawaited(todosGetTodoProtoList());
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
  Future<void> todosGetTodoProtoList() async {
    // if(preset==null) return;
    try {
      final protoList = await preset!.todosGetTodoProtoListCall();
      emit(TodoListState.success(asItems(protoList)));
    } on Exception {
      emit(const TodoListState.failure());
    }
  }

  // remove item
  Future<void> todosRemoveTodo(String id) async {
    final deleteInProgress = state.items.map((item) {
      return item.id == id ? item.copyWith(isDeleting: true) : item;
    }).toList();

    emit(TodoListState.success(deleteInProgress));

    unawaited(
      preset!.todosRemoveTodoCall(id).then((_) {
        final deleteSuccess = List.of(state.items)
          ..removeWhere((element) => element.id == id);
        emit(TodoListState.success(deleteSuccess));
      }),
    );
  }

  List<TodoItem> asItems(TodoProtoList protoList) {
    return protoList.items.map((e) => TodoItem(value: e)).toList();
  }
}

