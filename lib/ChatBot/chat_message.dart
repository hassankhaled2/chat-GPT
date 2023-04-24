import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
        required this.text,
        required this.sender,
        this.isImage = false});
  //super.key because Statelesswidget it make inheretance from widget

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        sender=="user"? Image(image: AssetImage('images/usericon.png'),width: 50,height: 50,):Image(image: AssetImage('images/robot.png'),height: 50,width: 50),
        Expanded(
          child: isImage
              ? AspectRatio(
            aspectRatio: 16 / 9,
            //the ratio of width to it's height
            child: Image.network(
              text,
              loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : const CircularProgressIndicator.adaptive(),
            ),
          )
              : text.trim().text.bodyText1(context).make().px8(),
        ),
      ],
    ).py8();
  }
}