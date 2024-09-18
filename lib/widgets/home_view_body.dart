import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/all_taska_cubit/all_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/views/history_deleted_view.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/tasks_list_view.dart';

//importaaaannttt***********************************************
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<AlltasksCubit>(context).allTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TodoModel> todoList = BlocProvider.of<AlltasksCubit>(context).allData;
    return BlocBuilder<AlltasksCubit, AlltasksState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
             const SizedBox(
                height: 30,
              ),
              CustomAppBar(
                name: 'ToDo',
                icon: Icons.delete_sweep_outlined,
                onPressed: () {
                  Navigator.pushNamed(context, HistoryDeletedView.id);
                
                },
              ),
              Expanded(
                child: TasksListView(tasks: todoList),
              ),
            ],
          ),
        );
      },
    );
  }
}


