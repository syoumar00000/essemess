import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:igs/Screens/authentication/component/authentication_layout.dart';
import 'package:igs/Screens/authentication/signup_screen.dart';
import 'package:igs/Screens/home_screen.dart';
import 'package:igs/components/input/custom_textfield.dart';
import 'package:igs/models/firebase_helper_model.dart';
import 'package:igs/styles/spacing_style.dart';
import 'package:igs/styles/text_style.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _addressMail = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthenticationLayout(
          img: 1,
          color: Color(0xFFF2F2F2),
          title: "Sign In",
          child: Column(
            children: [
              kSpaceH(1),
              CustomTextField(
                controller: _addressMail,
                type: TextInputType.emailAddress,
                icon: Icons.email,
                isPassword: false,
                label: "Addresse Mail",
                showPassword: false,
              ),
              kSpaceH(1),
              CustomTextField(
                label: "Mot de passe *",
                icon: Icons.lock,
                isPassword: true,
                showPassword: showPassword,
                controller: _password,
                onVisiblePassword: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                type: TextInputType.text,
              ),
              kSpaceH(1),
              Container(
                  padding: EdgeInsets.only(left: 200),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: Color(0XFFEA5863), fontWeight: FontWeight.bold),
                  )),
              kSpaceH(1.5),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 3, backgroundColor: Color(0XFFEA5863)),
                  onPressed: _handleLog,
                  child: Text(
                    "Log In",
                    style: kHeadline6(context, Colors.white),
                  ),
                ),
              ),
              kSpaceH(7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ?",
                    style: TextStyle(color: Color(0XFF97999B), fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFEA5863),
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleLog() {
    if (_addressMail.text != "") {
      if (_password.text != "") {
        //connexion
        FirebaseHelper()
            .handleSignIn(_addressMail.text, _password.text)
            .then((user) => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainAppController())),
                })
            .catchError((error) {
          alerte(error.toString());
        });
      } else {
        alerte("veuillez renseigner votre mot de passe svp!");
      }
    } else {
      alerte("veuillez renseigner votre addresse email svp!");
    }
  }

  Future<void> alerte(String message) async {
    Text title = Text("Erreur");
    Text msg = Text(message);
    TextButton okButton = TextButton(
        onPressed: () => Navigator.of(context).pop(), child: Text("OK"));
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return (Theme.of(context).platform == TargetPlatform.iOS)
              ? CupertinoAlertDialog(
                  title: title,
                  content: msg,
                  actions: [okButton],
                )
              : AlertDialog(
                  title: title,
                  content: msg,
                  actions: [okButton],
                );
        });
  }
}
