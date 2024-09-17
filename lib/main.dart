import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/all_taska_cubit/all_tasks_cubit.dart';
import 'package:todo_app/cubits/delete_tast_cubit/delete_task_cubit.dart';
import 'package:todo_app/cubits/histoy_deleted_tasks_cubit/history_deleted_tasks_cubit.dart';
import 'package:todo_app/simple_bloc_observer.dart';
import 'package:todo_app/views/edit_task_view.dart';
import 'package:todo_app/views/history_deleted.dart';
import 'package:todo_app/views/home_view.dart';

void main() {
  
  Bloc.observer = SimpleBlocObserver();
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) => AlltasksCubit(),
    
        ),
            BlocProvider(
                create: (context) => DeleteTaskCubit(),
            ),
            BlocProvider(
                create: (context) => HistoryDeletedTasksCubit(),
            ),
        ],
              child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              EditTaskView.id: (context) =>const EditTaskView(),
              HomeView.id: (context) =>const HomeView(),
              HistoryDeleted.id: (context) =>const HistoryDeleted(),
            },
            theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
            initialRoute: HomeView.id,
          ),
    );
  }
}
