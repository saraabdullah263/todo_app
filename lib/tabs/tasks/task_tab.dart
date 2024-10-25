import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/tabs/tasks/widget/custom_card.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  EasyInfiniteDateTimelineController? controller =
      EasyInfiniteDateTimelineController();
  DateTime selectedDate = DateTime.now();
  List<TaskModel>task_model=List.generate(10, (index) => TaskModel(name: 'name$index', details: 'details$index', date: DateTime.now()),);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .07,
        ),
        EasyInfiniteDateTimeLine(
          showTimelineHeader: false,
          controller: controller,
          firstDate: DateTime(2020),
          focusDate: selectedDate,
          lastDate: DateTime(2025),
          dayProps: EasyDayProps(
              inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10))),
              activeDayStyle: DayStyle(
                  dayNumStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor),
                  monthStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).primaryColor),
                  dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).primaryColor),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)))),
          onDateChange: (newdate) {
            selectedDate = newdate;
            setState(() {});
          },
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemBuilder: (context, index) => CustomCard(model:task_model[index],),
          itemCount: task_model.length,
          ),
        )),
      ],
    );
  }
}
