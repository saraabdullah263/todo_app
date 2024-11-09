import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/comman/remot/firebase_services.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getTasksByDate() async {
    try {
      List<TaskModel> allTasks = await FirebaseServices.getTasksByDate(
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day));
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
          fontSize: 16.0);
    }
  }

  Future<void> addTask(TaskModel newTask) async {
    try {
      await FirebaseServices.addTask(newTask).timeout(
        const Duration(microseconds: 1),
        onTimeout: () {
          changeSelsectedDate(selectedDate);
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  changeSelsectedDate(DateTime newdate) async {
    try {
      selectedDate = newdate;
      notifyListeners();
      await getTasksByDate();
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  deletetask(String taskId) async {
    try {
      await FirebaseServices.deletTask(taskId).then((value) {
        Fluttertoast.showToast(
            msg: 'Task Deleted',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        notifyListeners();
        getTasksByDate();
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  updateTask(String id,TaskModel task) async{
     try {
      await FirebaseServices.updateTask(id, task).then((value) {
        Fluttertoast.showToast(
            msg: 'Task updated',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        notifyListeners();
        getTasksByDate();
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  

  }
}
