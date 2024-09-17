import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/sqldb.dart';
part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());

  SqlDb myDB = SqlDb();

  editeTask({int? id, String? title, String? subtitle}) async {
    try {
      emit(EditTaskLoading());
      var response = await myDB.updateData('''UPDATE "todo" 
SET "title" = '${title}',"subtitle" = '${subtitle}'
WHERE "id" = ${id};''');

      print('editteeee task ====${response}');

      emit(EditTaskSuccess());
    } on Exception catch (e) {
      emit(
        EditTaskFailuer(errMessage: 'error edit task =======${e.toString()}'),
      );
    }
  }

  editeColorTask({int? id, int? color}) async {
    try {
      emit(EditTaskLoading());
      var response = await myDB.updateData('''UPDATE "todo" 
SET  "color" = $color 
WHERE "id" = ${id}''');

      print('editteeee task colorrrr====${response}');

      emit(EditTaskSuccess());
    } on Exception catch (e) {
      emit(
        EditTaskFailuer(errMessage: 'error edit task =======${e.toString()}'),
      );
    }
  }
}
