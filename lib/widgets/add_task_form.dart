import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/cubits/all_taska_cubit/all_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/colors_list_view.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CustomTextFormFild(
            onChanged: (data) => title = data,
            hintText: 'Title',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormFild(
            onChanged: (data) => content = data,
            hintText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          const ColorListView(),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                var dateTime = DateTime.now();
                var formattedDate = DateFormat('yMMMd').format(dateTime);
                TodoModel noteModel = TodoModel(
                  title: title!,
                  subTitle: content!,
                  date: formattedDate.toString(),
                  color: Color(0xffa0e7e5).value,
                );

                BlocProvider.of<AddTaskCubit>(context).addTask(noteModel);
                Navigator.pop(context);
                BlocProvider.of<AlltasksCubit>(context).allTasks();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Note added successfully!'),
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            buttonName: 'Add',
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
