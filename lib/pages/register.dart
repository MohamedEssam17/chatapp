import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/widgets/contans.dart';
import 'package:chatapp/widgets/custom_buttom.dart';
import 'package:chatapp/widgets/custom_textfield.dart';
import 'package:chatapp/widgets/helper/show_nakbar.dart';
import 'package:chatapp/widgets/password_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registerpage extends StatefulWidget {
  Registerpage({super.key});
  static String id = "Registerpage";

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  String? email;

  String? password;

  bool isloading =false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isloading ,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                SizedBox(
                  height: 77,
                ),
                Image.asset(
                  "assets/images/scholar.png",
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scholar Chat",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: "Pacifico"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 88,
                ),
                Row(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextformfied(
                  onchange: (data) {
                    email = data;
                  },
                  textfield: 'Email',
                ),
                SizedBox(
                  height: 14,
                ),
                PasswordCustomTextformfied(
                  onchange: (data) {
                    password = data;
                  },
                  textfield: 'Password',
                  obsectetext: true,
                ),
                SizedBox(
                  height: 14,
                ),
                CustomButtom(
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                             isloading = true;
                        });
                     
                        try {
                          await registeruser();
                            Navigator.pushNamed(context,Chatpage.id);
                        } on FirebaseException catch (ex) {
                          if (ex.code == "week-password") {
                            snakbarmessage(context, "week password");
                          } else if (ex.code == "email-already-in-use") {
                            snakbarmessage(context, "email already in use");
                          }
                        } catch (ex) {
                          snakbarmessage(context, "there is an error");
                        }
                        setState(() {
                           isloading = false;
                        });
                       
                      } else {}
                    },
                    text: "Register"),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account ? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " Log in",
                        style: TextStyle(color: Color(0xffc7ede6)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future<void> registeruser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
