import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/histoy_deleted_tasks_cubit/history_deleted_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/tasks_deleted_list_view.dart';

class HistoryDeletedViewBody extends StatefulWidget {
  const HistoryDeletedViewBody({super.key});

  @override
  State<HistoryDeletedViewBody> createState() => _HistoryDeletedViewBodyState();
}

class _HistoryDeletedViewBodyState extends State<HistoryDeletedViewBody> {
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
              SizedBox(
                  height: 70,
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: CustomButton(
                      buttonName: "Delete all",
                      onPressed: () {
                        BlocProvider.of<HistoryDeletedTasksCubit>(context)
                            .deleteAllTaskFromHistory();
                        BlocProvider.of<HistoryDeletedTasksCubit>(context)
                            .allTasksdeletedInHomeToHistory();
                      },
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
