import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:igs/components/image/custom_image.dart';
import 'package:igs/models/firebase_helper_model.dart';
import 'package:igs/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfilController extends StatefulWidget {
  const ProfilController({Key? key}) : super(key: key);

  @override
  _ProfilControllerState createState() => _ProfilControllerState();
}

class _ProfilControllerState extends State<ProfilController> {
  MyUser? me;
  TextEditingController _prenoms = TextEditingController();
  TextEditingController _noms = TextEditingController();
  final User? user = FirebaseHelper().auth.currentUser;
  @override
  void initState() {
    super.initState();
    _getUser();
  }
  /*  @override
  void dispose() {
    _getUser();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return (me == null)
        ? Center(
            child: Text("Chargement..."),
          )
        : SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomImage(
                    color: Color(0XFFEA5863),
                    imageUrl: me!.imageUrl,
                    initiales: me!.initiales.toUpperCase(),
                    radius: MediaQuery.of(context).size.width / 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          _takeAPic(ImageSource.camera);
                        },
                        icon: Icon(Icons.camera_enhance),
                      ),
                      IconButton(
                        onPressed: () {
                          _takeAPic(ImageSource.gallery);
                        },
                        icon: Icon(Icons.photo_library),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _prenoms,
                    decoration: InputDecoration(hintText: me!.prenoms),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _noms,
                    decoration: InputDecoration(hintText: me!.nom),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFEA5863),
                    ),
                    onPressed: upDateUser,
                    child: Text("Sauvegarder"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: logOut,
                      child: Text(
                        "Se Déconnecter",
                        style: TextStyle(color: Color(0XFF000000)),
                      )),
                ],
              ),
            ),
          );
  }

  Future<void> logOut() async {
    Text title = Text("Se Déconnecter");
    Text content = Text("Etes vous sur de vouloir vous déconnecter ?");
    ElevatedButton noBtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFFEA5863),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("Non"),
    );
    ElevatedButton yesBtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFFEA5863),
      ),
      onPressed: () {
        FirebaseHelper()
            .handleLogOut()
            .then((bool) => {Navigator.of(context).pop()});
      },
      child: Text("Oui"),
    );
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return (Theme.of(context).platform == TargetPlatform.iOS)
              ? CupertinoAlertDialog(
                  title: title,
                  content: content,
                  actions: <Widget>[yesBtn, noBtn],
                )
              : AlertDialog(
                  title: title,
                  content: content,
                  actions: <Widget>[yesBtn, noBtn],
                );
        });
  }

  upDateUser() {
    Map map = me!.toMap();
    if (_prenoms.text != "" && _prenoms.text != null) {
      map["prenoms"] = _prenoms.text;
    }
    if (_noms.text != "" && _noms.text != null) {
      map["nom"] = _noms.text;
    }
    FirebaseHelper().addUser(me!.uid, map);
    _getUser();
  }

  _getUser() {
    FirebaseHelper().getUser(user!.uid).then((me) {
      setState(() {
        this.me = me;
      });
    });
  }

  Future<void> _takeAPic(ImageSource source) async {
    final XFile? img = await ImagePicker()
        .pickImage(source: source, maxHeight: 500, maxWidth: 500);
    if (img != null) {
      File file = File(img.path);
      FirebaseHelper.savePic(file, FirebaseHelper.entryUser.child(me!.uid))
          .then((str) {
        Map map = me!.toMap();
        map["imageUrl"] = str;
        FirebaseHelper().addUser(me!.uid, map);
        _getUser();
      });
    }
  }
}
