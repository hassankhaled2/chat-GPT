import 'package:flutter/material.dart';

Widget defultButton({
  required String text,
  Color backcolor = Colors.black,
  double width = double.infinity,
  required void Function()? function,
}) {
  return Container(
    width: width,
    child: MaterialButton(
      elevation: 20,
      child: Text(text, style: TextStyle(color: Colors.white)),
      onPressed: function,
      color: backcolor,
    ),
  );
}

Widget defultTextform({
  Color? prefixcolor,
  TextStyle? labelStyle,
  required TextEditingController controler,
  required TextInputType keyboard,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? onTap,
  bool isClickable = true,
  required bool isPassword,
  void Function()? onsuffixpressed,
}) {
  return TextFormField(
    enabled: isClickable,
    controller: controler,
    onTap: onTap,
    keyboardType: keyboard,
    obscureText: isPassword,
    style: TextStyle(color: Colors.white),

    decoration: InputDecoration(
      labelStyle: labelStyle,
      labelText: label,
      border: OutlineInputBorder(),
      prefixIcon: Icon(
        prefix,
        color: prefixcolor,
      ),
      suffixIcon: suffix != null
          ? IconButton(onPressed: onsuffixpressed, icon: Icon(suffix))
          : null,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.pink,
          width: 2.0,
        ),
      ),
    ),
    validator: validate,
  );
}
