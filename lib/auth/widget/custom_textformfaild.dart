import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/comman/app_colors.dart';

class CustomTextformfaild extends StatefulWidget {
  const CustomTextformfaild(
      {super.key,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.keyboardType,
      this.password = false,
      this.validator});
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool password;
  final String? Function(String?)? validator;

  @override
  State<CustomTextformfaild> createState() => _CustomTextformfaildState();
}

class _CustomTextformfaildState extends State<CustomTextformfaild> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        style: TextStyle(color: Colors.black),
        keyboardType: widget.keyboardType,
        obscureText: widget.password && !showPassword,
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.password == true
                ? Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton.filled(
                    style: IconButton.styleFrom(backgroundColor: Colors.white,),
                      
                      icon: Icon(
                        showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () {
                        showPassword =! showPassword;
                        setState(() {});
                      },),
                )
                : widget.suffixIcon,
            fillColor: AppColors.primaryColor.withOpacity(0.1),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
