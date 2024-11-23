import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/comman/app_colors.dart';
import 'package:todo_app/comman/widget/custom_elevatedbutton.dart';
import 'package:todo_app/comman/widget/custom_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/provider/theme_provide.dart';
import 'package:todo_app/tabs/tasks/model/task_model.dart';

class EditTask extends StatefulWidget {
  static String routeName = "EditTask";

  const EditTask({super.key, this.model});
  final TaskModel? model;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as TaskModel;
    var themeProvider = Provider.of<ThemeProvide>(context);
    var taskProvider = Provider.of<TaskProvider>(context);
    titleController.text = args.name;
    detailsController.text = args.details;
    selectedDate = args.date;
    return CustomScaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(AppLocalizations.of(context)!.todolist),
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            width: MediaQuery.of(context).size.width * .75,
            height: MediaQuery.of(context).size.height * .75,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text('Edit task',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'edit name',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: detailsController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'editdetails',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.selsectdate,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
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
                          lastDate:
                              DateTime.now().add(const Duration(days: 200)),
                          builder: (context, child) {
                            return Theme(
                                data: themeProvider.themeMode == ThemeMode.light
                                    ? ThemeData.light().copyWith(
                                        colorScheme: ColorScheme.light(
                                        primary: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        onPrimary: Colors.white,
                                        onSurface: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ))
                                    : ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark(
                                        primary: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        onPrimary: Colors.black,
                                        onSurface: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .1,
                      vertical: MediaQuery.of(context).size.height * .1,
                    ),
                    child: CustomElevatedbutton(
                        onPressed: () async {
                         await  taskProvider.editTask(
                              args.id,
                              TaskModel(
                                  name: titleController.text.trim(),
                                  details: detailsController.text.trim(),
                                  date: selectedDate));
                                  Navigator.of(context).pop();
                        },
                        title: 'Save Changes'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
