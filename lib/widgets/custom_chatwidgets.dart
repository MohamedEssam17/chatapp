import 'package:chatapp/models/chat_appmodels.dart';
import 'package:chatapp/widgets/contans.dart';
import 'package:flutter/material.dart';

class CustomChatWidget extends StatelessWidget {
  const CustomChatWidget({
    super.key, required this.message,
  });
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
padding: EdgeInsets.only(left: 16 , top: 32 , bottom: 32 , right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: KPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
class CustomChatWidgetanotherchat extends StatelessWidget {
  const CustomChatWidgetanotherchat({
    super.key, required this.message,
  });
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
padding: EdgeInsets.only(left: 16 , top: 32 , bottom: 32 , right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)),
          color: Color(0xff006d84),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}