part of 'milestones.dart';

class MilestonesTodoItem extends Equatable {
  const MilestonesTodoItem({
    required this.value,
    this.isDeleting = false,
  });

  String get id => value.itemId;
  final TodoProto value;
  final bool isDeleting;

  MilestonesTodoItem copyWith({ TodoProto? value, bool? isDeleting}) {
    return MilestonesTodoItem(
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object> get props => [id, value, isDeleting];
}

enum MilestonesTodoListStatus { loading, success, failure }

class MilestonesTodoListState extends Equatable {
  const MilestonesTodoListState._({
    this.status = MilestonesTodoListStatus.loading,
    this.items = const <MilestonesTodoItem>[],
  });

  const MilestonesTodoListState.loading() : this._();

  const MilestonesTodoListState.success(List<MilestonesTodoItem> items)
      : this._(status: MilestonesTodoListStatus.success, items: items);

  const MilestonesTodoListState.failure() : this._(status: MilestonesTodoListStatus.failure);

  final MilestonesTodoListStatus status;
  final List<MilestonesTodoItem> items;

  @override
  List<Object> get props => [status, items];
}


