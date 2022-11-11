import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:igs/Screens/controller/chat_controller.dart';
import 'package:igs/components/image/custom_image.dart';
import 'package:igs/models/conversation_model.dart';
import 'package:igs/models/date_helper_model.dart';
import 'package:igs/models/firebase_helper_model.dart';

class MessageController extends StatefulWidget {
  const MessageController({Key? key}) : super(key: key);

  @override
  _MessageControllerState createState() => _MessageControllerState();
}

class _MessageControllerState extends State<MessageController> {
  String uid = FirebaseHelper().auth.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
        query: FirebaseHelper.entryConversation.child(uid),
        sort: (a, b) => b.key!.compareTo(a.key!),
        reverse: false,
        itemBuilder: (BuildContext ctx, DataSnapshot snap,
            Animation<double> animation, int index) {
          Conversation conversation = Conversation(snap);
          String sub = (conversation.uid == uid) ? "Moi : " : "";
          sub += ("${conversation.msg}");
          return Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Column(
              children: [
                ListTile(
                  leading: CustomImage(
                    color: Color(0XFFEA5863),
                    imageUrl: conversation.user.imageUrl,
                    initiales: conversation.user.initiales,
                    radius: 20,
                  ),
                  title: Text(conversation.user.fullName()),
                  subtitle: Text(sub),
                  trailing: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(DateHelper().convert(conversation.date)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: CircleAvatar(
                            backgroundColor: Color(0XFFEA5863),
                            radius: 8,
                            child: Text(
                              "1",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                  onTap: () async {
                    Future.delayed(Duration(milliseconds: 3000), () async {
                      await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (BuildContext ctx) {
                        return ChatController(partenaire: conversation.user);
                      }));
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          );
        });
  }
}
