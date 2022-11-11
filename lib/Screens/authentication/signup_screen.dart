import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:igs/Screens/authentication/component/authentication_layout.dart';
import 'package:igs/Screens/authentication/signin_screen.dart';
import 'package:igs/components/input/custom_textfield.dart';
import 'package:igs/models/firebase_helper_model.dart';
import 'package:igs/styles/spacing_style.dart';
import 'package:igs/styles/text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  TextEditingController _prenoms = TextEditingController();
  TextEditingController _addressMail = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _noms = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthenticationLayout(
          img: 2,
          color: Colors.transparent,
          title: "Sign Up",
          child: Column(
            children: [
              kSpaceH(1),
              CustomTextField(
                icon: Icons.person_outlined,
                controller: _noms,
                type: TextInputType.text,
                isPassword: false,
                label: 'Noms',
                showPassword: false,
              ),
              kSpaceH(1),
              CustomTextField(
                icon: Icons.person_outlined,
                controller: _prenoms,
                type: TextInputType.text,
                isPassword: false,
                label: 'Prénoms',
                showPassword: false,
              ),
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
              kSpaceH(2),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 3, backgroundColor: Color(0XFFEA5863)),
                  onPressed: _handleLog,
                  child: Text(
                    "Create Account",
                    style: kHeadline6(context, Colors.white),
                  ),
                ),
              ),
              /*  Container(
                  padding: EdgeInsets.only(left: 0, top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0XFFEA5863),
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Flexible(
                        child: Text(
                          "Creating an account means you're okay with our Terms of Service,Privacy Policy, and our defaults Notification Settings.",
                          style: TextStyle(
                            color: Color(0XFF97999B),
                          ),
                        ),
                      ),
                    ],
                  )), */
              kSpaceH(1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ?",
                    style: TextStyle(
                      color: Color(0XFF97999B),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFEA5863),
                      ),
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
    if (_noms.text != "") {
      if (_prenoms.text != "") {
        if (_addressMail.text != "") {
          if (_password.text != "") {
            // creer utilisateur
            FirebaseHelper()
                .create(_addressMail.text, _password.text, _prenoms.text,
                    _noms.text)
                .then((user) => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen())),
                    })
                .catchError((error) {
              alerte(error.toString());
            });
          } else {
            alerte("veuillez renseigner votre mot de passe svp!");
          }
        } else {
          alerte("veuillez renseigner votre addresse svp!");
        }
      } else {
        alerte("veuillez renseigner vos prenoms svp!");
      }
    } else {
      alerte("veuillez renseigner votre nom svp!");
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
