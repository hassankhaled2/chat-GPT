import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled23/HowToUse.dart';

import 'LoginScreen.dart';
import 'component.dart';






class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var NameController = TextEditingController();
  var SecondController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool isPassword=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xffFF131428),
      body:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(

                    child: Text(
                        "Create Account",
                        style: TextStyle(color: Color( 0xffFFDE2060),)
                    ),
                    onPressed:(){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>HowToUse()
                          ));
                    }
                ),
                // Text(
                //     "Login",
                //   style:TextStyle(fontSize: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Column(
                    children: [

                      SizedBox(
                        height: 8,
                      ),
                      defaultFormField(
                          label: "First Name",
                          prefix: Icons.person,
                          labelStyle: TextStyle(color: Colors.white),
                          controller:NameController,
                          type:TextInputType.text,
                          validate:(value)
                          {
                            if(value!.isEmpty)
                            {
                              return ' First Name must no be empty';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      defaultFormField(
                          prefix: Icons.person,
                          label:"Last Name",
                          labelStyle: TextStyle(color: Colors.white),
                          controller:SecondController,
                          type:TextInputType.text,
                          validate:(value)
                          {
                            if(value!.isEmpty)
                            {
                              return ' Last Name must no be empty';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      defaultFormField(
                          labelStyle: TextStyle(color: Colors.white),
                          label: "Email",
                          controller:emailController,
                          prefix: Icons.email,
                          type:TextInputType.emailAddress,
                          validate:(value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'email must not be empty';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 8,
                      ),


                      defaultFormField(
                          labelStyle: TextStyle(color: Colors.white),
                          label: "Password",
                          controller:passwordController,
                          prefix: Icons.lock,
                          obscureText: !isPassword,
                          suffix: isPassword?Icons.visibility:Icons.visibility_off,
                          isPassword: isPassword,
                          suffixPressed: ()
                          {
                            setState(() {
                              isPassword=!isPassword;
                            });
                          },
                          type:TextInputType.visiblePassword,
                          validate:(value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'password is too short';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      defaultFormField(
                          labelStyle: TextStyle(color: Colors.white),
                          label: " Confirm Password",
                          controller:ConfirmPasswordController,
                          prefix: Icons.lock,
                          obscureText: !isPassword,
                          suffix: isPassword?Icons.visibility:Icons.visibility_off,
                          isPassword: isPassword,
                          suffixPressed: ()
                          {
                            setState(() {
                              isPassword=!isPassword;
                            });
                          },
                          type:TextInputType.visiblePassword,
                          validate:(value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'password is not the same';
                            }
                            return null;
                          }
                      ),
                    ],
                  ),
                ),
                defaultButtonRegister(
                  text: "Create Account",
                  function: () {
                    if (formkey.currentState?.validate() != null) {
                      print(emailController.text);
                      print(passwordController.text);
                    }
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "already have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(

                          child: Text(
                              "Login",
                              style: TextStyle(color: Color( 0xffFFDE2060),)
                          ),
                          onPressed:(){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context)=>LogIn()
                                ));
                          }
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
