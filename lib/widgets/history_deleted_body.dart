
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/histoy_deleted_tasks_cubit/history_deleted_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/tasks_deleted_list_view.dart';

class HistoryDeletedBody extends StatefulWidget {
  const HistoryDeletedBody({super.key});

  @override
  State<HistoryDeletedBody> createState() => _HistoryDeletedBodyState();
}

class _HistoryDeletedBodyState extends State<HistoryDeletedBody> {
  @override
  void initState() {
    BlocProvider.of<HistoryDeletedTasksCubit>(context)
        .allTasksdeletedInHomeToHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryDeletedTasksCubit, HistoryDeletedTasksState>(
      builder: (context, state) {
        List<TodoModel> todoList =
            BlocProvider.of<HistoryDeletedTasksCubit>(context)
                .allDataDeletedTasks;
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomAppBar(
                name: 'History',
                icon: Icons.check,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: TasksDeletedListView(tasks: todoList),
              ),
            ],
          ),
        );
      },
    );
  }
}
