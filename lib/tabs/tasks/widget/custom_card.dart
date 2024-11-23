import 'package:date_format/date_format.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/comman/app_colors.dart';
import 'package:todo_app/comman/remot/firebase_services.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/screens/widget/edit%20_task.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.model});
  final TaskModel model;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      color: Theme.of(context).colorScheme.secondary,
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(10)),
              onPressed: (context) {
                Provider.of<TaskProvider>(context, listen: false)
                    .deletetask(widget.model.id);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, EditTask.routeName,
                    arguments: widget.model);
              },
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .12,
          child: Center(
            child: ListTile(
              leading: Container(
                width: MediaQuery.of(context).size.width * .01,
                height: MediaQuery.of(context).size.height * .12,
                color: widget.model.isDone == false
                    ? Theme.of(context).primaryColor
                    : Colors.green,
              ),
              title: Text(widget.model.name,
                  style: widget.model.isDone == false
                      ? Theme.of(context).textTheme.titleMedium
                      : Theme.of(context).textTheme.bodySmall),
              subtitle: Text(
                widget.model.details,
                style: TextStyle(
                    color: widget.model.isDone == false
                        ? Theme.of(context).colorScheme.onPrimary
                        : Colors.green),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    widget.model.isDone = !widget.model.isDone;
                    provider.editIsDone(widget.model.id, widget.model.isDone);
                    
                  },
                  child: widget.model.isDone == false
                      ? Container(
                          width: MediaQuery.of(context).size.width * .18,
                          height: MediaQuery.of(context).size.height * .035,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 30,
                          ))
                      : Text(
                          "IsDone!",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 22, fontWeight: FontWeight.w900),
                        )),
            ),
          ),
        ),
      ),
    );
  }

//   deleteButton(){

//     setState(() {
//       isButtonVisible=false;
//     });
//   }
//    Widget buttonStyle() {
//     return isButtonVisible
//         ? IconButton(icon:const Icon(Icons.done),color:Colors.white,alignment: Alignment.center ,onPressed: (deleteButton),)
//         : const Text(
//             'Done!',
//             style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.w900),
//           );

//   }
}
