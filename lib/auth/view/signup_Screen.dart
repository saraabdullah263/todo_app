import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/auth/models/user_data_model.dart';
import 'package:todo_app/auth/provider/auth_provider.dart';
import 'package:todo_app/auth/view/login_Screen.dart';
import 'package:todo_app/auth/widget/custom_textformfaild.dart';
import 'package:todo_app/comman/widget/custom_elevatedbutton.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = "SignUpScreen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailControllar = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameControllar = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    //var provider=Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Form(
          key: formKey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
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
                'Craete account',
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
                  if (isValidEmail(p0 ?? '')) {
                    return null;
                  } else {
                    return 'valid email';
                  }
                },
              ),
              CustomTextformfaild(
                controller: nameControllar,
                prefixIcon: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  margin: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                hintText: 'Enter your name',
                keyboardType: TextInputType.text,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "name can't be empty";
                  } else if (p0.length < 7) {
                    return "name can't be less than 7";
                  } else {
                    return null;
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
                  if (p0 == null || p0.isEmpty) {
                    return "password can't be empty";
                  } else if (p0.length < 7) {
                    return "password can't be less than 7";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 150,
                child:  Provider.of<LocalAuthProvider>(context).loading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomElevatedbutton(
                        onPressed: () async {
                          if (formKey1.currentState!.validate()) {
                            await Provider.of<LocalAuthProvider>(context,
                                    listen: false)
                                 .register(
                                    UserDataModel(
                                        name: nameControllar.text,
                                        email: emailControllar.text),
                                    passwordController.text)
                                .then(
                              (value)  {
                                
                                if (Provider.of<LocalAuthProvider>(context,
                                            listen: false)
                                        .userDataModel !=
                                    null) {
                                  Provider.of<TaskProvider>(context,
                                          listen: false)
                                      .getTasksByDate();
                                  Navigator.of(
                                    context,
                                  ).pushReplacementNamed(HomeScreen.routeName);
                                } 
                              },
                            );
                          }
                        },
                        title: 'sign up'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: const Text(' login'))
                ],
              ),
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
