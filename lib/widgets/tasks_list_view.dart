import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/all_taska_cubit/all_tasks_cubit.dart';
import 'package:todo_app/cubits/delete_tast_cubit/delete_task_cubit.dart';
import 'package:todo_app/cubits/histoy_deleted_tasks_cubit/history_deleted_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
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
        onPressed: () {
          BlocProvider.of<HistoryDeletedTasksCubit>(context)
              .addDeletedTaskToHistory(tasks[index]);

          BlocProvider.of<DeleteTaskCubit>(context)
              .deleteTask(tasks[index].id!);
          BlocProvider.of<AlltasksCubit>(context).allTasks();
        },
        task: tasks[index],
      ),
    );
  }
}
