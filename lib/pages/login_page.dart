import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/register.dart';
import 'package:chatapp/widgets/contans.dart';
import 'package:chatapp/widgets/custom_buttom.dart';
import 'package:chatapp/widgets/custom_textfield.dart';
import 'package:chatapp/widgets/helper/show_nakbar.dart';
import 'package:chatapp/widgets/password_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});
static String id="Loginpage";

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool isloading = false;
    String? email;

  String? password;


  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
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
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextformfied(
                  onchange: (data) {
                    email=data;
                  },
                  textfield: 'Email',
                ),
                SizedBox(
                  height: 14,
                ),
                PasswordCustomTextformfied(
                  onchange: (data) {
                    password=data;
                    
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
                          await loginuser();
                     Navigator.pushNamed(context,Chatpage.id , arguments: email);
                        } on FirebaseException catch (ex) {
                          if (ex.code == "user-not-found") {
                            snakbarmessage(context, "user not found");
                          } else if (ex.code == "wrong-password") {
                            snakbarmessage(context, "wrong password");
                          }
                        } catch (ex) {
                          snakbarmessage(context, "there is an error");
                        }
                        setState(() {
                          isloading = false;
                        });
                      } else {}
                    },
                    text: "Log in"),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account ?",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Registerpage.id);
                      },
                      child: Text(
                        " Register",
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
    Future<void> loginuser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
