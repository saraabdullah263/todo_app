import 'package:flutter/material.dart';
import 'package:todo_app/comman/app_theme.dart';
import 'package:todo_app/screens/home_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}