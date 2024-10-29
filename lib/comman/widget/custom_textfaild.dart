import 'package:flutter/material.dart';

class CustomTextfaild extends StatelessWidget {
  CustomTextfaild(
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
      style: TextStyle(fontSize: 20),
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 15)),
    );
  }
}
