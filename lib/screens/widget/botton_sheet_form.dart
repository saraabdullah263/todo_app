import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/comman/app_colors.dart';
import 'package:todo_app/comman/widget/custom_elevatedbutton.dart';
import 'package:todo_app/comman/widget/custom_textfaild.dart';

class BottonSheetForm extends StatefulWidget {
  const BottonSheetForm({super.key});

  @override
  State<BottonSheetForm> createState() => _BottonSheetFormState();
}

class _BottonSheetFormState extends State<BottonSheetForm> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskdetailsController = TextEditingController();
  GlobalKey<FormState> formKay = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKay,
            child: Column(
              children: [
                Text(
                  'Add New Task',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CustomTextfaild(
                  hintText: 'Task Name',
                  controller: taskNameController,
                  validator: (name) {
                    if (name == null || name == '') {
                      return 'task name can not be embty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfaild(
                  hintText: 'Task details',
                  controller: taskdetailsController,
                  maxLines: 5,
                  validator: (details) {
                    if (details == null || details == '') {
                      return 'task details can not be embty';
                    } else if (details.length < 5) {
                      return 'task  details can not be less than 5';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'select Date:',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () async {
                      var date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: selectedDate,
                        lastDate: DateTime.now().add(const Duration(days: 200)),
                        builder: (context, child) {
                          return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme:ColorScheme.light(
                                  primary: AppColors
                                      .primaryColor, // header background color
                                  onPrimary: Colors.white, // header text color
                                  onSurface: AppColors
                                      .primaryColor, // body text color
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors
                                        .primaryColor, // button text color
                                  ),
                                ),
                              ),
                              child: child!);
                        },
                      );
                      if (date != null) {
                        selectedDate = date;
                        setState(() {});
                      }
                    },
                    child: Text(dateFormat.format(selectedDate),style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.primaryColor),)),
                const SizedBox(
                  height: 15,
                ),
                CustomElevatedbutton(
                  title: 'Add',
                  onPressed: () {
                    if (formKay.currentState!.validate() == true) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
