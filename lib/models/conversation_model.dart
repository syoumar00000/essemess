import 'package:firebase_database/firebase_database.dart';
import 'package:igs/models/user_model.dart';

class Conversation {
  late MyUser user;
  late String date;
  late String msg;
  late String uid;

  Conversation(DataSnapshot snapshot) {
    //Object? value = snapshot;
    user = MyUser(snapshot);
    uid = snapshot.child("monId").value.toString();
    msg = snapshot.child("lastMessage").value.toString();
    date = snapshot.child("dateString").value.toString();
  }
}
