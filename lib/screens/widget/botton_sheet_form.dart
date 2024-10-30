import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/comman/app_colors.dart';
import 'package:todo_app/comman/widget/custom_elevatedbutton.dart';
import 'package:todo_app/comman/widget/custom_textfaild.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/provider/theme_provide.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class BottonSheetForm extends StatefulWidget {
  const BottonSheetForm({super.key});

  @override
  State<BottonSheetForm> createState() => _BottonSheetFormState();
}

class _BottonSheetFormState extends State<BottonSheetForm> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskdetailsController = TextEditingController();
  GlobalKey<FormState> formKay = GlobalKey<FormState>();
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);
    var theme_provide = Provider.of<ThemeProvide>(context);
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKay,
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.addnewtask,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextfaild(
                  hintText: AppLocalizations.of(context)!.taskname,
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
                  hintText: AppLocalizations.of(context)!.taskdetails,
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
                  AppLocalizations.of(context)!.selsectdate,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
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
                              data: theme_provide.themeMode == ThemeMode.light
                                  ? ThemeData.light().copyWith(
                                      colorScheme: ColorScheme.light(
                                      primary: Theme.of(context).colorScheme.primary,
                                      onPrimary:
                                          Colors.white, 
                                      onSurface: Theme.of(context).colorScheme.primary,
                                    ))
                                  : ThemeData.dark().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: Theme.of(context).colorScheme.primary, 
                                      onPrimary:
                                          Colors.black, 
                                      onSurface: Theme.of(context).colorScheme.primary,
                                      
                                      
                                    )
                                      ),
                              child: child!);
                        },
                      );
                      if (date != null) {
                        selectedDate =
                            DateTime(date.year, date.month, date.day);
                        setState(() {});
                      }
                    },
                    child: Text(
                      dateFormat.format(selectedDate),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.primaryColor),
                    )),
                const SizedBox(
                  height: 15,
                ),
                CustomElevatedbutton(
                  title: isLoading ? 'loadings...' : 'Add',
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (formKay.currentState!.validate() == true) {
                            TaskModel newTask = TaskModel(
                                date: selectedDate,
                                name: taskNameController.text.trim(),
                                details: taskdetailsController.text.trim());
                            setState(() {
                              isLoading = true;
                            });

                            await provider.addTask(newTask);
                            Navigator.of(context).pop();
                            setState(() {
                              isLoading = false;
                            });
                          }
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
