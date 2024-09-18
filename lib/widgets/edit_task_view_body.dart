import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/all_taska_cubit/all_tasks_cubit.dart';
import 'package:todo_app/cubits/edite_task_cubit/edit_task_cubit.dart';
import 'package:todo_app/cubits/histoy_deleted_tasks_cubit/history_deleted_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';
import 'package:todo_app/widgets/edit_colors_list_view.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({super.key, required this.task});
  final TodoModel task;

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  String? title, subTitel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomAppBar(
            name: 'Edit',
            icon: Icons.check,
            onPressed: () {
              String t = widget.task.title = title ?? widget.task.title;
              String st =
                  widget.task.subTitle = subTitel ?? widget.task.subTitle;

              BlocProvider.of<EditTaskCubit>(context)
                  .editeTask(id: widget.task.id, title: t, subtitle: st);

              Navigator.pop(context);

              BlocProvider.of<AlltasksCubit>(context).allTasks();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormFild(
            hintText: 'Title',
            controller: TextEditingController(text: widget.task.title),
            onChanged: (data) {
              title = data;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormFild(
            controller: TextEditingController(text: widget.task.subTitle),
            onChanged: (data) {
              subTitel = data;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          EditColorsListView(
            task: widget.task,
          )
        ],
      ),
    );
  }
}

class EditTaskViewBodyForHistory extends StatefulWidget {
  const EditTaskViewBodyForHistory({super.key, required this.task});
  final TodoModel task;

  @override
  State<EditTaskViewBodyForHistory> createState() =>
      _EditTaskViewBodyForHistoryState();
}

class _EditTaskViewBodyForHistoryState
    extends State<EditTaskViewBodyForHistory> {
  String? title, subTitel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomAppBar(
            name: 'Edit',
            icon: Icons.check,
            onPressed: () {
              String t = widget.task.title = title ?? widget.task.title;
              String st =
                  widget.task.subTitle = subTitel ?? widget.task.subTitle;

              BlocProvider.of<HistoryDeletedTasksCubit>(context)
                  .editeEletedTaskinHistory(
                      id: widget.task.id, title: t, subtitle: st);

              Navigator.pop(context);
              BlocProvider.of<HistoryDeletedTasksCubit>(context)
                  .allTasksdeletedInHomeToHistory();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormFild(
            hintText: 'Title',
            controller: TextEditingController(text: widget.task.title),
            onChanged: (data) {
              title = data;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormFild(
            controller: TextEditingController(text: widget.task.subTitle),
            onChanged: (data) {
              subTitel = data;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          EditColorsListView(
            task: widget.task,
          )
        ],
      ),
    );
  }
}
