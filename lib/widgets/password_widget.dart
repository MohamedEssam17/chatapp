import 'package:flutter/material.dart';

class PasswordCustomTextformfied extends StatefulWidget {
  PasswordCustomTextformfied({Key? key, this.textfield, this.onchange, this.obsectetext = false})
      : super(key: key);

  final String? textfield;
  final Function(String)? onchange;
  final bool? obsectetext;

  @override
  _CustomTextformfiedState createState() => _CustomTextformfiedState();
}

class _CustomTextformfiedState extends State<PasswordCustomTextformfied> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      style: TextStyle(color: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return " required data";
        }
        return null;
      },
      onChanged: widget.onchange,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: widget.textfield,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
        ),
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