import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/cubits/all_taska_cubit/all_tasks_cubit.dart';
import 'package:todo_app/cubits/histoy_deleted_tasks_cubit/history_deleted_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/views/edit_task_view.dart';
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
      padding: const EdgeInsets.all(0),
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskItem(
        icon: Icon(FontAwesomeIcons.rotateRight),
        pushPadge: EditTaskViewForHistory.id,
        task: tasks[index],
        onPressed: () {
          BlocProvider.of<AddTaskCubit>(context).addTask(tasks[index]);
          BlocProvider.of<HistoryDeletedTasksCubit>(context)
              .deleteTaskFromHistory(tasks[index].id!);
          BlocProvider.of<HistoryDeletedTasksCubit>(context)
              .allTasksdeletedInHomeToHistory();
          BlocProvider.of<AlltasksCubit>(context).allTasks();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Note added successfully!'),
            ),
          );
        },
      ),
    );
  }
}
