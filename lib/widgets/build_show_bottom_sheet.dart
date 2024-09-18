import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/widgets/add_task_form.dart';

class BuildShowBottomSheet extends StatelessWidget {
  const BuildShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const SingleChildScrollView(
            child: AbsorbPointer(
          absorbing: State is AddTaskLoading ? true : false,
          child: AddTaskForm(),
        )));
  }
}
