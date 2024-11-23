import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String name;
  String details;
  bool isDone;
  DateTime date;
  String id;
  TaskModel({
    required this.name,
    required this.details,
    required this.date,
    this.isDone=false,
    this.id = '',
  });
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'] ?? 'Unnamed Task',
          details: json['details'] ??'' ,
          isDone: json['isDone'] ,
          date:(json['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
          id: json['id'] ?? '',
        );
        

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'details': details,
      'date': Timestamp.fromDate(date),
      'isDone': isDone ,
      'id': id
    };
  }
}
