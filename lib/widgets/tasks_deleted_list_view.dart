import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/histoy_deleted_tasks_cubit/history_deleted_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/task_item.dart';

class TasksDeletedListView extends StatelessWidget {
  const TasksDeletedListView({
    super.key,
    required this.tasks,
  });

  final List<TodoModel> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:const EdgeInsets.all(0),
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskItem(
        task: tasks[index],
        onPressed: () {

          BlocProvider.of<HistoryDeletedTasksCubit>(context)
              .deleteTaskFromHistory(tasks[index].id!);
          BlocProvider.of<HistoryDeletedTasksCubit>(context)
              .allTasksdeletedInHomeToHistory();
        },
      ),
    );
  }
}
