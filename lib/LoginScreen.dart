import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled23/HowToUse.dart';

import 'RegisterScreen.dart';
import 'components.dart';
import 'homeScreen.dart';








class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  IconData eyeIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff090C22),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defultTextform(
                    controler: emailController,
                    keyboard: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "email must not be empty";
                      }
                      return null;
                    },
                    labelStyle: TextStyle(color: Colors.white),
                    label: "Email",
                    prefix: Icons.email_outlined,
                    prefixcolor: Colors.white,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defultTextform(
                      controler: passController,
                      keyboard: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password!";
                        }
                        return null;
                      },
                      label: "password",
                      labelStyle: TextStyle(color: Colors.white),
                      prefix: Icons.lock,
                      prefixcolor: Colors.white,
                      suffix:
                      isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      onsuffixpressed: () {
                        setState(() {});
                        isPassword = !isPassword;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defultButton(
                    backcolor: Colors.pink,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>HowToUse()));
                      }
                    },
                    text: "LOGIN",
                  ),
                  SizedBox(
                    height: 17.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don\'t hava an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(

                          child: Text(
                            'Register Now',
                            style: TextStyle(color: Colors.pink),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,MaterialPageRoute(builder: (Context)=>RegisterScreen())
                            );
                          }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
