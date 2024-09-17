import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/sqldb.dart';
import 'package:todo_app/model/todo_model.dart';

part 'history_deleted_tasks_state.dart';

class HistoryDeletedTasksCubit extends Cubit<HistoryDeletedTasksState> {
  HistoryDeletedTasksCubit() : super(HistoryDeletedTasksInitial());

  SqlDb myDB = SqlDb();
  List<TodoModel> allDataDeletedTasks = [];

  addDeletedTaskToHistory(TodoModel todo) {
    try {
      var response = myDB.insertData(
          '''INSERT INTO "deletedtodolist" ("title", "subtitle", "date", "color") 
VALUES ('${todo.title}', '${todo.subTitle}', '${todo.date}', ${todo.color})''');

      print('add deleted task to history ====${response}');

      emit(HistoryDeletedTasksSuccess());
    } on Exception catch (e) {
      emit(
        HistoryDeletedTasksFailure(
            errMessage: 'error add deletedtask =======${e.toString()}'),
      );
    }
  }

  allTasksdeletedInHomeToHistory() async {
    try {
      List<Map> response =
          await myDB.readData('SELECT * FROM "deletedtodolist"');

      allDataDeletedTasks.clear();

      for (var i = 0; i < response.length; i++) {
        allDataDeletedTasks.add(TodoModel.formJson(response[i]));
      }

      print('all data deleted history ====${allDataDeletedTasks}');

      emit(HistoryDeletedTasksSuccess());
    } on Exception catch (e) {
      emit(
        HistoryDeletedTasksFailure(
            errMessage: 'error all data deleted history =======${e.toString()}'),
      );
    }
  }

  deleteTaskFromHistory(int id) async {
    try {
       await myDB
          .deleteData('DELETE FROM "deletedtodolist" WHERE "id" = $id');

      print('deleete task from history ====${id}');

      emit(HistoryDeletedTasksSuccess());
    } on Exception catch (e) {
      emit(
        HistoryDeletedTasksFailure(
            errMessage: 'deleete task from history =======${e.toString()}'),
      );
    }
  }

  editeEletedTaskinHistory({int? id, String? title, String? subtitle}) async {
    try {
      var response = await myDB.updateData('''UPDATE "deletedtodolist" 
SET "title" = '${title}',"subtitle" = '${subtitle}'
WHERE "id" = ${id};''');

      print('edit task in history ====${response}');

      emit(HistoryDeletedTasksSuccess());
    } on Exception catch (e) {
      emit(
        HistoryDeletedTasksFailure(
            errMessage: 'error edit task in history  =======${e.toString()}'),
      );
    }
  }

  editeColorDeletedTaskInHistory({int? id, int? color}) async {
    try {
      var response = await myDB.updateData('''UPDATE "deletedtodolist" 
SET  "color" = $color 
WHERE "id" = ${id}''');

      print('edit task colorrrr in history====${response}');

      emit(HistoryDeletedTasksSuccess());
    } on Exception catch (e) {
      emit(
        HistoryDeletedTasksFailure(
            errMessage: 'error edit task colorrrr in history =======${e.toString()}'),
      );
    }
  }
}
