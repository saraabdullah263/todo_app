import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/view/signup_Screen.dart';
import 'package:todo_app/auth/widget/custom_textformfaild.dart';
import 'package:todo_app/comman/widget/custom_elevatedbutton.dart';
import 'package:todo_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControllar = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey <FormState>formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.2,),
        
              const Center(
                  child: Text(
                'TO DO APP',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Pacifico'),
              )),
              const SizedBox(
                height: 20,
              ),
        
              const Center(
                  child: Text(
                'Please enter your email address and enter your password',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )),
              const SizedBox(
                height: 20,
              ),
              CustomTextformfaild(
                controller: emailControllar,
                prefixIcon: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  margin: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: (p0) {
                  if(isValidEmail(p0??'')){
                    return null;
                  }
                  else {
                    return 'valid email';
                  }
                },
              ),
              CustomTextformfaild(
                controller: passwordController,
                prefixIcon: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  margin: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.lock_clock_outlined,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                hintText: 'Enter your password',
                password: true,
                validator: (p0) {
                  if(p0==null||p0.isEmpty){
                    return "password can't be empty";
                  }
                  else if(p0.length<7){
                    return "password can't be less than 7";
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.3,),
              TextButton(
                  onPressed: () {}, child: const Text('Forget password ?')),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 150,
                child: CustomElevatedbutton(onPressed: () {
                  if(formKey.currentState!.validate()){
                    //login firebase
                  }
                }, title: 'Login'),
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(onPressed: () {
                    Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
                  }, child: const Text(' Register'))
                ],
              ),
              //  const Row(
              //     children: [
              //       Expanded(child: Divider(indent: 5,endIndent: 5,color: Colors.grey,)),
              //       Text('OR'),
              //       Expanded(child: Divider(indent: 5,endIndent: 5,color: Colors.grey))
              //     ],
              //   ),
              //   Row(
              //     children: [
              //       IconButton.filled(onPressed: () {
        
              //       }, icon: Icon(Icons.facebook_outlined,color: Colors.white,)),
              //        IconButton.filled(onPressed: () {
        
              //       }, icon: Icon(Icons.laptop_chromebook_outlined,color: Colors.white,))
              //     ],
              //   )
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
