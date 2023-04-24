
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class About extends StatelessWidget{
  final Uri _url = Uri.parse('https://www.techopedia.com/definition/34933/chatgpt');
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text('Learn about chatgpt '),
            leading: IconButton(onPressed: (){ Navigator.pop( context);
            }, icon: Icon(Icons.arrow_back))


            ,backgroundColor: Colors.pink,
          ),
          backgroundColor:Color(0xff1A1B2D),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //color: Colors.lightBlue,
                child:Center(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image:AssetImage(
                              'images/robot.png'
                          ),
                          height: 150,

                        ),


                        SizedBox(width:5,height:17)
                        ,Text('what is chat GPT ?',textDirection: TextDirection.ltr,style:
                        TextStyle(fontSize: 32
                          ,
                          color: Colors.pink,
                          fontWeight:FontWeight.bold,),),
                        SizedBox(width: 10,height: 17,)
                        ,Text('    ChatGPT (Chat Generative Pre-trained Transformer) is a natural language processing tool driven by AI technology that allows youto have human-like conversations '
                            'and much more with a chatbot. '
                            'The language model can answer questions, and assist you with tasks such as composing emails, '
                            'essays, and code.',textDirection: TextDirection.ltr,style:
                        TextStyle(fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold,
                            wordSpacing: 3),)
                        ,SizedBox(width: 15,height: 15,)
                        ,Text('    It was launched as a prototype on November 30, 2022,by San Francisco-based '
                            'OpenAI,   quickly'
                            ' garnered attention for its detailed '
                            'responses and articulate answers across many domains of knowledge.'
                          ,textDirection: TextDirection.ltr
                          , style: TextStyle(fontSize: 16,
                              color: Colors.white,
                              fontWeight:FontWeight.bold,
                              wordSpacing: 3),
                        ),SizedBox(width: 15,height: 15,)
                        ,Text('    Its uneven factual accuracy was identified as a significant drawback . '
                            'it is an approach to transfer learning with both supervised and '
                            'reinforcement learning techniques.'
                            '  the main use of chat gpt is Send alerts and messages'
                            ' across different platforms with a'
                            ' highly available,'
                            ' low-latencypublish/subscribe (pub/sub) service.'
                            ' Build and deploy data-driven apps faster using a low-code '
                            'application development platform. '
                            'Build AI-powered chatbots and conversational interfaces.'
                          ,textDirection:
                          TextDirection.ltr,style: TextStyle(fontSize: 16,color: Colors.white,
                              fontWeight: FontWeight.bold,wordSpacing: 3),),
                        SizedBox(width: 15,height: 15,)
                        ,Text('    It is built on top of OpenAI GPTfamily of large language models,'
                            'and is fine-tuned. '
                            'The service works best in English,but is also able to function in'
                            'some otherlanguages,to varying degree of success.unlike some other recent'
                            'high-profile advances in AI.',textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize:16,color:Colors.white,fontWeight: FontWeight
                              .bold,wordSpacing: 3),),
                        SizedBox(width: 15,height: 15,)
                        ,Text('    PT-2 is a popular transformer-based text generation model. '
                            'It is pre-trained on a large corpus of raw English text with no human labeling. '
                            'Given a partial sequence (a sentence or a piece of text) during training,'
                            ' the model predicts the next token (such as a word or letter) in the sequence.', textDirection:
                        TextDirection.ltr,style: TextStyle(fontSize: 16,
                            color: Colors.white,
                            fontWeight:FontWeight.bold,wordSpacing:3),),
                        SizedBox(width: 15,height: 15,)
                        ,Text('    With GPT you can generate coherent and well-written texts in a wide range of styles,'
                            ' topics and languages. In addition, news summaries, product '
                            'descriptions or stories can be generated. Thanks to this chat, problems can be analyzed '
                            'and solutions or answers to questions can be generated.',
                          textDirection:TextDirection.ltr,style: TextStyle(fontSize: 16,
                              color: Colors.white,
                              fontWeight:FontWeight.bold,wordSpacing:3),),
                        SizedBox(width: 15,height: 15,),
                        Text('    One of the biggest advantages is that chatbots are available 24 hours a day to help'
                            'customers. In addition, they respond quickly to all the questions they receive. '
                            'This guarantees two very important things for almost all companies:'
                            ' Satisfied customers with immediate responses and resolutions.',textDirection:TextDirection.ltr,style: TextStyle(fontSize: 16,
                            color: Colors.white,
                            fontWeight:FontWeight.bold,wordSpacing:3),),
                        SizedBox(width: 15,height: 15,),
                        Text('    Chatbots can automate tasks performed frequently and at specific times. '
                            'This gives employees time to focus on more important tasks'
                            ' and prevents customers from waiting to receive responses. '
                            'Proactive customer interaction.',
                          textDirection:TextDirection.ltr,style: TextStyle(fontSize: 16,
                              color: Colors.white,
                              fontWeight:FontWeight.bold,wordSpacing:3),),
                        MaterialButton(
                          color: Colors.pinkAccent,
                          elevation:50,
                          highlightColor: Colors.green,
                          onPressed: _launchUrl,
                          child: Text('Read more',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),



                      ],
                    )),
              ),
            ),)


      );

  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }

  }

}