import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/auth/models/user_data_model.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class FirebaseServices {
  static CollectionReference<TaskModel> getTaskCollection() =>
      getUserCollection()
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('tasks')
          .withConverter<TaskModel>(
              fromFirestore: (snapshot, _) =>
                  TaskModel.fromJson(snapshot.data() ?? {}),
              toFirestore: (value, _) => value.toJson());

  static Future<void> addTask(TaskModel task) {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    DocumentReference<TaskModel> docRefrence = tasksCollection.doc();
    task.id = docRefrence.id;
    return docRefrence.set(task);
  }

  static Future<void> deletTask(String id) {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    return tasksCollection.doc(id).delete();
  }

  // static Future<void> updateTask(String id, Map<TaskModel, dynamic> task) {
  //   CollectionReference<TaskModel> tasksCollection = getTaskCollection();
  //   return tasksCollection.doc(id).update(task);
  // }
 static Future<void> updateTasks(String id, Map<Object, Object?> data) {
  CollectionReference<TaskModel>tasksCollection=getTaskCollection();
    return tasksCollection.doc(id).update(data);
  }

// static  Future<List<TaskModel>> getTasks() async {
//   try { CollectionReference<TaskModel> tasksCollection = getTaskCollection();
//     QuerySnapshot<TaskModel> tasksQuary = await tasksCollection.get();
//     return tasksQuary.docs
//         .map(
//           (e) => e.data(),
//         )
//         .toList();
//   }catch(e){
//     return [];
//   }
//   }
  static Future<List<TaskModel>> getTasksByDate(DateTime selectedDate) async {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    QuerySnapshot<TaskModel> tasksQuary = await tasksCollection
        .where('date', isEqualTo: Timestamp.fromDate(selectedDate))
        .get();
    return tasksQuary.docs
        .map(
          (e) => e.data(),
        )
        .toList();
  }

  static Future<UserDataModel?> login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    FirebaseAuth.instance.currentUser!.uid;
    return getUser();
  }

  static Future<UserDataModel> register(
      UserDataModel userDataModel, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userDataModel.email!, password: password);
    FirebaseAuth.instance.currentUser!.uid;
    userDataModel.id = userCredential.user?.uid;
    await createUser(userDataModel);
    return userDataModel;
  }
  static Future<void>editIsdone(String taskId,bool isDone){
   return getTaskCollection().doc(taskId).update({'isDone': isDone} ,);
  }
  static Future<void>editTask(String taskId,TaskModel taskModel){
    return  getTaskCollection().doc(taskId).update(
      {'name': taskModel.name,
      'details': taskModel.details,
      'date': Timestamp.fromDate(taskModel.date),});
  }

  static CollectionReference<UserDataModel> getUserCollection() =>
      FirebaseFirestore.instance
          .collection('users')
          .withConverter<UserDataModel>(
              fromFirestore: (snapshot, _) =>
                  UserDataModel.fromJson(snapshot.data() ?? {}),
              toFirestore: (value, _) => value.toJson());

  static Future<UserDataModel?> getUser() async {
    DocumentSnapshot<UserDataModel> documentReference =
        await getUserCollection()
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    return documentReference.data();
  }

  static Future<void> createUser(UserDataModel userDataModel) async {
    return await getUserCollection().doc(userDataModel.id).set(userDataModel);
  }
 static Future<void> logOut()async{
   await FirebaseAuth.instance.signOut();
  }
}
