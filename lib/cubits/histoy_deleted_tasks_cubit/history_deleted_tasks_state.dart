part of 'history_deleted_tasks_cubit.dart';

@immutable
sealed class HistoryDeletedTasksState {}

final class HistoryDeletedTasksInitial extends HistoryDeletedTasksState {}

final class HistoryDeletedTasksSuccess extends HistoryDeletedTasksState {}

final class HistoryDeletedTasksFailure extends HistoryDeletedTasksState {
  String errMessage;
  HistoryDeletedTasksFailure({required this.errMessage});
}
