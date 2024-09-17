import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/cubits/edite_task_cubit/edit_task_cubit.dart';
import 'package:todo_app/cubits/histoy_deleted_tasks_cubit/history_deleted_tasks_cubit.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/colors_list_view.dart';

class EditColorsListView extends StatefulWidget {
  EditColorsListView({super.key, required this.task});
  TodoModel task;
  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColorsList.indexOf(Color(widget.task.color)); //last color
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 48),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColorsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<HistoryDeletedTasksCubit>(context)
                      .editeColorDeletedTaskInHistory(
                          id: widget.task.id, color: kColorsList[index].value);

                  BlocProvider.of<EditTaskCubit>(context).editeColorTask(
                      id: widget.task.id, color: kColorsList[index].value);

                  setState(() {});
                },
                child: ColorItem(
                  color: kColorsList[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
