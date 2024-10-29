import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class FirebaseServices {
  static CollectionReference<TaskModel> getTaskCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
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

  static Future<void> updateTask(String id, Map<TaskModel, dynamic> task) {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    return tasksCollection.doc(id).update(task);
  }

static  Future<List<TaskModel>> getTasks() async {
  try { CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    QuerySnapshot<TaskModel> tasksQuary = await tasksCollection.get();
    return tasksQuary.docs
        .map(
          (e) => e.data(),
        )
        .toList();
  }catch(e){
    return [];
  }
  }
 static  Future<List<TaskModel>> getTasksByDate(DateTime selectedDate)async{
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
   QuerySnapshot<TaskModel> tasksQuary=await tasksCollection.where('date',isEqualTo: Timestamp.fromDate(selectedDate)).get();
    return tasksQuary.docs
        .map(
          (e) => e.data(),
        )
        .toList();

  }
}
