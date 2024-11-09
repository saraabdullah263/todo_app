import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/auth/models/user_data_model.dart';
import 'package:todo_app/comman/remot/firebase_services.dart';

class LocalAuthProvider with ChangeNotifier {
  UserDataModel? userDataModel;
  bool loading =false;

 Future login(String email, String password) async {
   loading=true;
   notifyListeners();
    try {
      userDataModel = await FirebaseServices.login(email, password);
      notifyListeners();
    } catch (e) {
      loading=false;
      notifyListeners();
      String? massage;
      if (e is FirebaseAuthException) {
        massage = e.message;
      }
      Fluttertoast.showToast(
          msg: massage ?? 'some thing want wrong',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

 Future register(UserDataModel userDataModel, String password) async {
    loading=true;
      
    try {
      userDataModel = await FirebaseServices.register(userDataModel, password);
        notifyListeners();
        loading=false;
        notifyListeners();
    } catch (e) {
      loading=false;
      notifyListeners();
      String? massage;
      if (e is FirebaseAuthException) {
        massage = e.message;
      }
      Fluttertoast.showToast(
          msg: massage ?? 'some thing want wrong',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
