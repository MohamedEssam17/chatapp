import 'package:flutter/material.dart';

class CustomTextformfied extends StatelessWidget {
  CustomTextformfied({super.key, this.textfield, this.onchange ,this.obsectetext = false});
  String? textfield;
  Function(String)? onchange;
  bool ? obsectetext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsectetext! ,
      style: TextStyle(color: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return " required data";
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: textfield,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
