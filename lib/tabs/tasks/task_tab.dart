import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/tabs/tasks/widget/custom_card.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  EasyInfiniteDateTimelineController? controller =
      EasyInfiniteDateTimelineController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .07,
        ),
        EasyInfiniteDateTimeLine(
          showTimelineHeader: false,
          controller: controller,
          firstDate: DateTime(2020),
          focusDate: provider.selectedDate,
          lastDate: DateTime(2025),
          dayProps: EasyDayProps(
            todayStyle: DayStyle(
              dayNumStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimary
              ),
                      decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10)),
            ),
              inactiveDayStyle: DayStyle(
                  dayNumStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onPrimary),
                  monthStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.onPrimary),
                  dayStrStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.onPrimary),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
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
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10)))),
          onDateChange: (newdate) {
            provider.changeSelsectedDate(newdate);
          },
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemBuilder: (context, index) => CustomCard(
              model: provider.tasks[index],
            ),
            itemCount: provider.tasks.length,
          ),
        )),
      ],
    );
  }
}
