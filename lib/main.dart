import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Loginpage.id :(context) => Loginpage(),
        Registerpage.id :(context) => Registerpage(),
        Chatpage.id : (context) => Chatpage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Loginpage.id,
    );
  }
}
