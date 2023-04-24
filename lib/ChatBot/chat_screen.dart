import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:untitled23/homeScreen.dart';
import 'package:velocity_x/velocity_x.dart';


import '../HowToUse.dart';
import 'chat_message.dart';
import 'threedots.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  //package to edit the text
  final List<ChatMessage> _messages = [];
  ChatGPT? chatGPT;
  bool _isImageSearch = false;

  StreamSubscription? _subscription;

  //handle the stream message that make between you and bot

  bool _isTyping = false;

  @override
  void initState(){

    super.initState();

    chatGPT = ChatGPT.instance.builder(
      //chatgpt object from ChatGpt that we call it from package to can build api
      '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',
    );
  }

  @override
  void dispose() {
    chatGPT!.genImgClose();
    // لو مش هى ال image بيعمل cancel
    _subscription?.cancel();
    //livestream cancel image
    super.dispose();
  }


  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "user",
      isImage: false,
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();

    if (_isImageSearch) {
      final request = GenerateImage(message.text, 1, size: "256x256");

      _subscription = chatGPT!

      //object from stream subscription

          .generateImageStream(request)
          .asBroadcastStream()
          .listen((response) {
        Vx.log(response.data!.last!.url!);
        //vx--> displaying data or logs on screen by calling function inside it
        //log--> displaying separate line on debug mode
        //Mixins are a way of reusing a class's code in different class hierarchies.
        // For example, you might have a class called Employee which has methods like clockIn
        // The code in those classes may be useful for both Bartender and Nurse .
        // But, now imagine you're introducing a class called Doctor .
        insertNewData(response.data!.last!.url!, isImage: true);
      });
      //Display image on screen

    } else {
      final request = CompleteReq(
          prompt: message.text, model: kTranslateModelV3, max_tokens: 200);
      //package make call to text and translate it to the bot
      //tokens:Receive information about a user

      _subscription = chatGPT!
          .onCompleteStream(request: request)
          .asBroadcastStream()
          .listen((response) {
        Vx.log(response!.choices[0].text);
        //vx--> displaying data or logs on screen by calling function inside it
        //log--> displaying separate line on debug mode
        insertNewData(response.choices[0].text, isImage: false);
      });
    }
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "bot",
      isImage: isImage,
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: const InputDecoration.collapsed(
                hintText: "Question/description",
                hintStyle: TextStyle(color: Colors.grey)
            ),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              color: Color(0xffFF131428),
              icon: const Icon(Icons.send),
              onPressed: () {
                _isImageSearch = false;
                _sendMessage();
              },
            ),
            // TextButton(
            //     onPressed: () {
            //       _isImageSearch = true;
            //       _sendMessage();
            //     },
            //     child: const Text(""))
          ],
        ),
      ],
    ).px16();
    // make padding to cursor(package in velocity)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xff1A1B2D),
          title: const Text(
              "ChatAi",
            style: TextStyle(color:Colors.white),
          ),
          leading:IconButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:(context){
                        return HomeScreen();
                      }
                  )
              );
            },
            icon: Icon(
                Icons.arrow_back,
                    color: Colors.white,
            ),
          )

        ),
        body: SafeArea(
          // iphone emulator will need safearea علشان بيبقى نازل تحت اوى

          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                    //scroll the page
                    reverse: true,
                    padding: Vx.m8,
                    //padding in all text(user)

                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _messages[index];
                    },
                  )),
              if (_isTyping) const ThreeDots(),
              const Divider(
                height: 1.0,
              ),
              //make line to divide

              Container(
                // decoration: BoxDecoration(
                //   color: context.canvasColor,
                // ),
                //
                child: _buildTextComposer(),
                //widget call it
              )
            ],
          ),
        ));
  }
}
