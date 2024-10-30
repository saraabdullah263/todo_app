import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/comman/remot/firebase_services.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class TaskProvider with ChangeNotifier{
  List<TaskModel>tasks=[];
  DateTime selectedDate=DateTime.now();


  Future<void> getTasksByDate()async{
    try {
      List<TaskModel> allTasks = await FirebaseServices.getTasksByDate(DateTime(selectedDate.year,selectedDate.month,selectedDate.day));
      tasks = allTasks;
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }
Future<void>  addTask(TaskModel newTask)async{
  try{await FirebaseServices.addTask(newTask);
  changeSelsectedDate(selectedDate);
  }
  catch(e){
     Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  }
  changeSelsectedDate(DateTime newdate)async{
    try { selectedDate=newdate;
     await getTasksByDate();
     notifyListeners();
     }
      catch(e){
       Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
      }
  }
}