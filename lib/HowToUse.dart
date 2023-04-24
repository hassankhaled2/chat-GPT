import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "package:untitled23/homeScreen.dart";

import "ChatBot/chat_screen.dart";

class BoardingModel{
  late final String image;
  late final String title;
  late final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body
  });
}
class HowToUse extends StatefulWidget{
  @override
  State<HowToUse> createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  @override
  var boardControler =PageController();

  bool? islast=false;
  List <BoardingModel> boarding=[
    BoardingModel(image: "images/Howtouse.jpg",
      title: "Ask a question.",
      body: "awesome now you are ready",
    ),
    BoardingModel(image: "images/howtouse1.jpg",
      title: "Chat Bot response.",
      body: "awesome now you are ready",
    ),
    BoardingModel(image: "images/howtouse2.jpg",
      title: "Now our life is easier. ",
      body: "awesome now you are ready",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      // appBar: AppBar(
      //
      //   actions: [
      //     TextButton(
      //         style: ButtonStyle(
      //
      //         ),
      //         onPressed: (){
      //           IconButton(
      //             onPressed: (){
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder:(context){
      //                         return HomeScreen();
      //                       }
      //                   )
      //               );
      //             },
      //             icon: Icon(
      //                 Icons.arrow_forward_ios
      //             ),
      //           );
      //         },
      //         child: Text(
      //           "SKIP",
      //           style: TextStyle(
      //               fontSize: 15,
      //               color: Color(0xff110A66)
      //
      //           ),
      //         )
      //     )
      //
      //   ],
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ) ,
      appBar: AppBar(

        actions: [
          TextButton(
              style: ButtonStyle(

              ),
              onPressed: (){
                boardControler.jumpToPage(boarding.length);
              },
              child: Text(
                "SKIP",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff110A66)

                ),
              )
          )

        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ) ,

      body: SafeArea(

          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [

                Expanded(

                  child: PageView.builder(
                    onPageChanged: (index){

                      if(index==boarding.length-1){
                        setState(() {
                          islast=true;
                        });

                      }
                      else{
                        setState(() {
                          islast=false;
                        });

                      }


                    },
                    physics: BouncingScrollPhysics(),
                    controller: boardControler,
                    itemBuilder:(context,index)=>buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),

                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardControler,
                      count: boarding.length,
                    ),
                    Spacer(),
                    FloatingActionButton(
                      elevation: 15,
                      child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                      ),
                      onPressed: (){

                        if(islast==true){
                          Navigator.push(
                              context,MaterialPageRoute(builder: (context)=>HomeScreen())
                          );
                        }
                        else{
                          boardControler.nextPage(duration: Duration(
                            milliseconds: 750,
                          ), curve: Curves.fastLinearToSlowEaseIn);
                        }



                      },
                      backgroundColor: Color(0xff110A66),
                    ),


                  ],
                )
              ],
            ),
          )
      ),

    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage('${model.image}')),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "${model.title}",
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        height: 30,
      ),



    ],
  );
}