part of 'dummy.dart';

class DummyTodoItem extends Equatable {
  const DummyTodoItem({
    required this.value,
    this.isDeleting = false,
  });

  String get id => value.itemId;
  final TodoProto value;
  final bool isDeleting;

  DummyTodoItem copyWith({ TodoProto? value, bool? isDeleting}) {
    return DummyTodoItem(
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object> get props => [id, value, isDeleting];
}

enum DummyTodoListStatus { loading, success, failure }

class DummyTodoListState extends Equatable {
  const DummyTodoListState._({
    this.status = DummyTodoListStatus.loading,
    this.items = const <DummyTodoItem>[],
  });

  const DummyTodoListState.loading() : this._();

  const DummyTodoListState.success(List<DummyTodoItem> items)
      : this._(status: DummyTodoListStatus.success, items: items);

  const DummyTodoListState.failure() : this._(status: DummyTodoListStatus.failure);

  final DummyTodoListStatus status;
  final List<DummyTodoItem> items;

  @override
  List<Object> get props => [status, items];
}


