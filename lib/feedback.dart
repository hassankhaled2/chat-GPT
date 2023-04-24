import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'components.dart';


class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends  State<feedback> {
  List<bool> isTypeSelected = [false, false, false, true, true];
  bool imageFound=false;
  File? _image;
  var feedbackController = TextEditingController();
  Future pickImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final File imageTemp = File(image.path);
      setState(() {
        _image=imageTemp;
      });

    }   catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Color(0xff1A1B2D),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink,
        elevation: 2.0,
        centerTitle: true,
        title: Text(
          "Feedback",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            //
            SizedBox(
              height: 20.0,
            ),
            defultTextform(
                prefixcolor: Colors.white,

                labelStyle: TextStyle(

                    color: Colors.white

                ),

                controler: feedbackController,

                keyboard:TextInputType.text ,

                validate:(value){

                  if(value!.isEmpty)
                    return "please enter your feedback message";
                  else return null;
                } ,
                label: "Enter your feedback",

                prefix: Icons.feedback_outlined,

                isPassword: false
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),

                    child: IconButton(
                        icon: Icon(
                            Icons.add
                        ),
                        onPressed: () {

                          pickImage();
                        }




                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Upload screenshot (optional)",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  width: 10,),
                Row(
                  children: [
                    imageSelect(),

                  ],
                )
              ],
            ),
            SizedBox(height: 20.0),
            buildNumberField(),
            Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    width: 120,
                    height: 60,
                    child: ElevatedButton(
                      style:ButtonStyle(
                          elevation: MaterialStateProperty.all(20),
                          backgroundColor: MaterialStateProperty.all(Colors.pink)
                      ) ,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Chat Gpt"),
                            content: const Text("Thank You for your Feed Back"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                  color: Colors.pink,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("okay",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                      child: const Text(
                        'Send',
                        style: TextStyle(color: Colors.white),
                      ),

                    ),
                  ),

                ]
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
  Widget imageSelect(){
    if (_image!=null)
      return Image.file(_image!,width: 45,height: 45,);
    else
      return  Icon(Icons.image, color: Colors.white,);
  }
  buildNumberField() {
    return IntlPhoneField(
      dropdownTextStyle: TextStyle(
          color: Colors.white
      ),


      pickerDialogStyle:PickerDialogStyle(
        countryCodeStyle:TextStyle(
            color: Colors.pink
        ),


      ) ,

      dropdownIcon:Icon(
        Icons.arrow_drop_down,
        color: Colors.pink,
      ) ,

      decoration: InputDecoration(
        icon:Icon(
          Icons.phone,
          color: Colors.white,
        ) ,
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.pink
            )
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {

      },
    );
  }



  buildFeedbackForm() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          TextField(
            maxLines: 10,
            style: TextStyle(
                color: Colors.white
            ),
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                //color: Color(0xFFC5C5C5),
                color: Colors.pink,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    //  color: Color(0xFFA6A6A6),
                    color: Colors.white,
                  ),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [


                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Color(0xFFA5A5A5),
                            size:40 ,
                          ),
                          onPressed: () {
                            pickImage();
                            print(_image);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),

                  Text(
                    "Upload screenshot (optional)",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCheckItem({required String title,required  bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Icon(
            isSelected ?Icons.check_circle : Icons.circle,
            color: isSelected ? Colors.pink: Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.pink : Colors.white),
          ),
        ],
      ),
    );
  }
}