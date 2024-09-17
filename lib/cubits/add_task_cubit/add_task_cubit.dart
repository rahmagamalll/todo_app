import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/sqldb.dart';
import 'package:todo_app/model/todo_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  SqlDb myDB = SqlDb();

  int color = Color(0xffa0e7e5).value;

  addTask(TodoModel todo) {
    try {
      emit(AddTaskLoading());
      var response = myDB.insertData(
          '''INSERT INTO "todo" ("title", "subtitle", "date", "color") 
VALUES ('${todo.title}', '${todo.subTitle}', '${todo.date}', ${color})''');

      print('addddddddd task ====${response}');

      emit(AddTaskSuccess());
    } on Exception catch (e) {
      emit(
        AddTaskFailure(errMessage: 'error add task =======${e.toString()}'),
      );
    }
  }
}
