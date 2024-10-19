import 'package:flutter/material.dart';
import 'package:todo_app/tabs/settings/setting_tab.dart';
import 'package:todo_app/tabs/tasks/task_tab.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenttabindex=0;
  List<Widget>listTab=[const TaskTab(),const SettingTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: listTab[currenttabindex],
      bottomNavigationBar: BottomAppBar(
         shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        child:   BottomNavigationBar(
          onTap: (value) {
            currenttabindex=value;
            setState(() {
              
            });
          },
          currentIndex: currenttabindex,
          items: const[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'task list'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'setting'),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
    );
  }
}