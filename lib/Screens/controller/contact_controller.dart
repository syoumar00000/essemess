/* import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart'; */
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:igs/Screens/controller/chat_controller.dart';
import 'package:igs/components/image/custom_image.dart';
import 'package:igs/models/firebase_helper_model.dart';
import 'package:igs/models/user_model.dart';
/* import 'package:kozon/controller/chatController.dart';
import 'package:kozon/model/firebaseHelper.dart';
import 'package:kozon/model/myUser.dart';
import 'package:kozon/widgets/customImage.dart'; */

class ContactController extends StatefulWidget {
  const ContactController({Key? key}) : super(key: key);

  @override
  _ContactControllerState createState() => _ContactControllerState();
}

class _ContactControllerState extends State<ContactController> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: FirebaseHelper.userEntry,
      sort: (a, b) => (a
          .child('prenoms')
          .value
          .toString()
          .toLowerCase()
          .compareTo(b.child('prenoms').value.toString().toLowerCase())),
      itemBuilder: (BuildContext ctx, DataSnapshot snap,
          Animation<double> animation, int index) {
        MyUser newUser = MyUser(snap);
        if (FirebaseHelper().auth.currentUser!.uid == newUser.uid) {
          return Container(
              // child: Center(child: Text("Aucun utilisateur")),
              );
        } else {
          return Column(
            children: [
              ListTile(
                leading: CustomImage(
                    color: Color(0XFFEA5863),
                    imageUrl: newUser.imageUrl,
                    initiales: newUser.initiales,
                    radius: 22),
                title: Text(newUser.fullName()),
                subtitle: Text("Ecrivez Moi ..."),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ChatController(partenaire: newUser);
                      }),
                    );
                  },
                  icon: Icon(Icons.message),
                ),
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
          );
        }
      },
    );
  }
}
