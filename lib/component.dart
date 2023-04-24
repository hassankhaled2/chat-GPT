import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButtonRegister({
  double width = double.infinity,
  bool isUpperCase = true,
  required Function function,
  required String text
  // Color background = Colors.white,
})=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
  child: Container(
    // padding:  const EdgeInsets.symmetric(horizontal: 120,vertical:0 ),
    width: width,
    height: 40,
    child: MaterialButton(

      color: Color(0xffFFDE2060),
      onPressed:
          ()
      {
        function();
      },
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ),
);
Widget defaultFormField(
    {TextEditingController? controller,
      TextStyle? labelStyle,
      required TextInputType type,
      Function(String)? onSubmit,
      Function(String)? onChanged,
      GestureTapCallback? onTap,
      bool isPassword = false,
      required String? Function(String?)? validate,
      String? label,

      IconData? prefix,
      IconData? suffix,
      final VoidCallback? suffixPressed,
      bool? obscureText


    }) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,

      validator: validate,
      style: TextStyle(color:Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder
          (
          borderSide:BorderSide(color: Color(0xffFFDE2060),width: 2.5),

        ),

        prefixIcon: Icon(
          prefix,
          color: Colors.white,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
              suffix,
              color: Colors.white
          ),
        )
            : null,
        border: OutlineInputBorder(),
        labelText: label,
        labelStyle: labelStyle,
      ),
    );

