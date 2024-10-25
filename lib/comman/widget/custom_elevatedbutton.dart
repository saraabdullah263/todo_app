import 'package:flutter/material.dart';

class CustomElevatedbutton extends StatelessWidget {
  const CustomElevatedbutton({super.key,required this.onPressed,required this.title});
   final void Function()? onPressed;
   final String title;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    onPressed: onPressed,
                    child: Text(title,style:Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20,fontWeight:FontWeight.w100) ,)),
              );
  }
}