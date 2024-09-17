import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/sqldb.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());

  SqlDb myDB = SqlDb();

  deleteTask(int id) async {
    try {
     
          await myDB.deleteData('DELETE FROM "todo" WHERE "id" = $id');

      print('deleete task ====${id}');

      emit(DeleteTaskSuccess());
    } on Exception catch (e) {
      emit(
        DeleteTaskFailure(errMessage: 'error delete tasks =======${e.toString()}'),
      );
    }
  }
}
