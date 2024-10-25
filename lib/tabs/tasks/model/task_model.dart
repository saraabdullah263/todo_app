 class TaskModel{
  String name;
  String details;
  bool ?isDone;
  DateTime date;
  TaskModel({
    required this.name,
    required this.details,
    required this.date,
     this.isDone
  });
  
 }