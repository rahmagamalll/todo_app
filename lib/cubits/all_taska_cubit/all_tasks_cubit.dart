import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/sqldb.dart';
import 'package:todo_app/model/todo_model.dart';

part 'all_tasks_state.dart';

class AlltasksCubit extends Cubit<AlltasksState> {
  AlltasksCubit() : super(AlltasksInitial());

  SqlDb myDB = SqlDb();

  List<TodoModel> allData = [];

  allTasks() async {
    try {
      emit(AlltasksLoading());

      List<Map> response = await myDB.readData('SELECT * FROM "todo"');
      
      allData.clear();

      for (var i = 0; i < response.length; i++) {
        allData.add(TodoModel.formJson(response[i]));
      }

      print('all dattaaaaaa ====${allData}');

      emit(AlltasksSuccess());
    } on Exception catch (e) {
      emit(
        AlltasksFailure(errMessage: 'error all tasks =======${e.toString()}'),
      );
    }
  }
}
