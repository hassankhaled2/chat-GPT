import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled23/feedback.dart';
import 'package:untitled23/what%20is%20gpt.dart';

import 'ChatBot/chat_screen.dart';
import 'HowToUse.dart';


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A1B2D),

      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ai Chat GPT",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),


              ),

              SizedBox(
                height: 25,
              ),
              Container(
                decoration:BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.2),
                        spreadRadius: 7,
                        blurRadius: 5,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],

                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              child: Image(
                                  image:AssetImage(
                                    'images/robot.png',

                                  )
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ai Chat",
                                    style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                  ),
                                  Text("open ended conversation with an chatgpt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:(context){
                                          return ChatScreen();
                                        }
                                    )
                                );
                              },
                              icon: Icon(
                                  Icons.arrow_forward_ios
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height:0.3,
                      width:250.0,
                      color:Colors.black,),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              child: Image(
                                  image:AssetImage(
                                    'images/what.png',

                                  )
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("What is GPT?",
                                    style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                  ),
                                  Text("learn about chatgpt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:(context){
                                          return About();
                                        }
                                    )
                                );
                              },
                              icon: Icon(
                                  Icons.arrow_forward_ios
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height:0.3,
                      width:250.0,
                      color:Colors.black,),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              child: Image(
                                  image:AssetImage(
                                    'images/usericon.png',

                                  )
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("How To Use?",
                                    style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                  ),
                                  Text("learn how to use the app",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:(context){
                                          return HowToUse();
                                        }
                                    )
                                );

                              },
                              icon: Icon(
                                  Icons.arrow_forward_ios
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height:0.3,
                      width:250.0,
                      color:Colors.black,),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              child: Image(
                                  image:AssetImage(
                                    'images/positive-review.png',

                                  )
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Send Feedback",
                                    style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                  ),
                                  Text("post bugs or suggestions",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                              onPressed:
                                  ()
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:(context){
                                          return feedback();
                                        }
                                    )
                                );
                              },
                              icon: Icon(
                                  Icons.arrow_forward_ios
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height:0.3,
                        width:250.0,
                        color:Colors.black,),
                    ),

                  ],
                ),

              ),
            ],

          ),
        ),
      ) ,



    );

  }

}


