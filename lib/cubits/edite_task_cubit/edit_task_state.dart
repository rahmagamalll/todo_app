part of 'edit_task_cubit.dart';

@immutable
sealed class EditTaskState {}

final class EditTaskInitial extends EditTaskState {}

final class EditTaskLoading extends EditTaskState {}

final class EditTaskSuccess extends EditTaskState {}

final class EditTaskFailuer extends EditTaskState {
  String errMessage;
  EditTaskFailuer({required this.errMessage});
}
