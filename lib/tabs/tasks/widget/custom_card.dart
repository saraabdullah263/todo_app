import 'package:flutter/material.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class CustomCard extends StatelessWidget {
    const CustomCard({super.key,required this.model});
  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      color: Colors.white ,
      child: SizedBox(
        height: MediaQuery.of(context).size.height*.12,
        child: Center(
          child: ListTile(leading: Container(
            width: MediaQuery.of(context).size.width*.01,
            height:  MediaQuery.of(context).size.height*.12,
            color:Theme.of(context).primaryColor ,
          ),
          title: Text(model.name,style: Theme.of(context).textTheme.titleMedium,),
          subtitle: Text(model.details),
          trailing: Container(
            width: MediaQuery.of(context).size.width*.12,
            height: MediaQuery.of(context).size.height*.034,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor
          ,borderRadius: BorderRadius.circular(10))
          ,child:Icon(Icons.done,color:Colors.white ,) ,
          ),),
        ),
      ),
    );
  }
}