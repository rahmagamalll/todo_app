part of 'all_tasks_cubit.dart';

@immutable
sealed class AlltasksState {}

final class AlltasksInitial extends AlltasksState {}

final class AlltasksLoading extends AlltasksState {}

final class AlltasksSuccess extends AlltasksState {}

final class AlltasksFailure extends AlltasksState {
  String errMessage;
  AlltasksFailure({required this.errMessage});
}
