import 'package:chatapp/models/chat_appmodels.dart';
import 'package:chatapp/widgets/contans.dart';
import 'package:chatapp/widgets/custom_chatwidgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  Chatpage({Key? key}) : super(key: key);
  static String id = "Chatpage";
  TextEditingController controller = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(Kmessagecollection);
  final _controll = ScrollController();
  @override
  Widget build(BuildContext context) {
   var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KcreateAt , descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagelist.add(
              Message.fromjson(snapshot.data!.docs[i]),
            );
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: KPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Klogo,
                    height: 50,
                  ),
                  Text("chat"),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controll,
                    itemCount: messagelist.length,
                    itemBuilder: (context, index) {
                      return messagelist[index].id==email? CustomChatWidget(
                        message: messagelist[index],
                      ) : CustomChatWidgetanotherchat(message: messagelist[index],);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: "Send Message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: KPrimaryColor,
                        ),
                        onPressed: () {
                          final value = controller.text;
                          if (value.isNotEmpty) {
                            messages.add({
                              Kmessage: value,
                              KcreateAt: DateTime.now(),
                              "id":email
                            });
                            controller.clear();
                            _controll.animateTo(
                              0,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
