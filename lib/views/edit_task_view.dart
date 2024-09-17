import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/edite_task_cubit/edit_task_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});
  static String id = 'EditTaskView';
  @override
  Widget build(BuildContext context) {
    final TodoModel task =
        ModalRoute.of(context)!.settings.arguments as TodoModel;
    return Scaffold(
      backgroundColor: const Color(0xff141414),
      body: BlocProvider(
        create: (context) => EditTaskCubit(),
        child: EditTaskViewBody(
          task: task,
        ),
      ),
    );
  }
}
