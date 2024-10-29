import 'package:flutter/material.dart';
import 'package:todo_app/comman/widget/custom_scaffold.dart';
import 'package:todo_app/screens/widget/botton_sheet_form.dart';
import 'package:todo_app/tabs/settings/setting_tab.dart';
import 'package:todo_app/tabs/tasks/task_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenttabindex = 0;
  List<Widget> listTab = [const TaskTab(), const SettingTab()];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title:  Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(AppLocalizations.of(context)!.todolist),
        ),
      ),
      body: listTab[currenttabindex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
            onTap: (value) {
              currenttabindex = value;
              setState(() {});
            },
            currentIndex: currenttabindex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: 'task list'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'setting'),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
            return BottonSheetForm();
          },);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
