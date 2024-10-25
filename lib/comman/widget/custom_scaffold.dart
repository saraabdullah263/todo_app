import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key,this.body,this.appBar,this.bottomNavigationBar,this.floatingActionButton,this.floatingActionButtonLocation});
  final Widget? body;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).primaryColor,
        Theme.of(context).scaffoldBackgroundColor
      ], stops: [
        .2,
        .3
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        appBar: appBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
