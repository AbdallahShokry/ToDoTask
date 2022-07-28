import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:to_do/util/blocs/app/states.dart';

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  late Database database;

  void initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'toDo.db');

    debugPrint('AppDatabaseInitialized');

    openAppDatabase(
      path: path,
    );

    emit(AppDatabaseInitialized());
  }

  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT , currentDate DATE , startTime TIME , endTime TIME , status INTEGER)',
        );

        debugPrint('Table Created');
      },
      onOpen: (Database db) {
        debugPrint('AppDatabaseOpened');
        database = db;

        getTasksData();
      },
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController currentDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController remindController = TextEditingController();

  void insertTasksData() {

    database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(title, currentDate, startTime, endTime ) VALUES("${titleController.text}", "${currentDateController.text}", "${startTimeController.text}", "${endTimeController.text}")');
    }).then((value) {
      debugPrint('User Data Inserted');

      getTasksData();

      emit(AppDatabaseTaskCreated());
    });
  }
  void insertTasksStatus(theStatus){

    database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(status) VALUES("$theStatus")');
    }).then((value) {
      debugPrint('User Data Inserted');

      getTasksData();

      emit(AppDatabaseTaskCreatedStatus());
    });

  }


  List<Map> tasks = [];
  List<Map> status = [];

  void getTasksData() async {
    emit(AppDatabaseLoading());

    database.rawQuery('SELECT title FROM tasks ').then((value) {
      debugPrint('Users Data Fetched');
      tasks = value;
      debugPrint(tasks.toString());
      emit(AppDatabaseData());
    });
  }
  void getTasksStatus() async {
    emit(AppDatabaseLoading());

    database.rawQuery('SELECT title FROM tasks WHERE status = 0').then((value) {
      debugPrint('Users Data Fetched');
      status = value;
      debugPrint(status.toString());
      emit(AppDatabaseTasks());
    });
  }
  Map selectedTask = {};

  void selectUserToUpdate({
    required Map task,
  }) {
    selectedTask = task;

    emit(AppSelectUser());
  }



  void updateUserData(int theStatus) async {
    database.rawUpdate(
        'UPDATE tasks SET status = ${theStatus} WHERE id = ${selectedTask['id']}', ).then((value) {
      selectedTask = {};
      debugPrint('User Data Updated');
      getTasksStatus();
    });
  }

  void del(){
    database.transaction((txn) async {
      txn.rawDelete('DELETE FROM tasks ').then((value) => emit(DeleteTasks()));

    });}
}