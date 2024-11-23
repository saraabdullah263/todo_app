import 'package:flutter/material.dart';

class CustomTextfaild extends StatelessWidget {
 const CustomTextfaild(
      {super.key,
      this.hintText,
      required this.controller,
      this.maxLines,
      this.validator});
  final String? hintText;
  final TextEditingController controller;
  final int? maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onPrimary),
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

          hintText: hintText,
          hintStyle:const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 15)),
    );
  }
}
