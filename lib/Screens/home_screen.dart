import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:igs/Screens/controller/contact_controller.dart';
import 'package:igs/Screens/controller/message_controller.dart';
import 'package:igs/Screens/controller/profil_controller.dart';
import 'package:igs/config/app_config.dart';
import 'package:igs/models/firebase_helper_model.dart';

class MainAppController extends StatefulWidget {
  @override
  State<MainAppController> createState() => _MainAppControllerState();
}

class _MainAppControllerState extends State<MainAppController> {
  final User? user = FirebaseHelper().auth.currentUser;
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    final se = Theme.of(context).platform;
    if (se == TargetPlatform.iOS) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: Color(0XFFEA5863),
            activeColor: Colors.yellow,
            inactiveColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.message)),
              BottomNavigationBarItem(icon: Icon(Icons.supervisor_account)),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
            ],
          ),
          tabBuilder: (BuildContext ctx, int index) {
            Widget controllerSelected = controllers()[index];
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: Image.asset(
                  kAppLogo,
                  width: 10,
                ),
                title: Text("èssèmèss"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.more_vert_sharp,
                      size: 30,
                    ),
                  ),
                ],
              ),
              body: controllerSelected,
            );
          });
    } else {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              leading: Image.asset(
                kAppLogo,
                width: 10,
              ),
              title: Text("èssèmèss"),
              actions: [
                PopupMenuButton(
                  color: Color(0XFFEA5863),
                  position: PopupMenuPosition.under,
                  initialValue: selectedValue,
                  onSelected: (int value) => setState(() {
                    selectedValue = value;
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.more_vert_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(
                        "bonjour et bienvenue",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text(
                        "Mes Messages",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text(
                        "Mes Contacts",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text(
                        "Mon Profil",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text(
                        "A propos de èssèmèss",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 4,
                    ),
                    PopupMenuItem(
                      child: Text(
                        "Nos Partenaires",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 5,
                    ),
                    PopupMenuItem(
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          kAppLogo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      value: 6,
                    ),
                  ],
                ),

                /*  Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: 
                     Icon(
                      Icons.more_vert_sharp,
                      size: 30,
                    ), 
                ), */
              ],
              bottom: TabBar(
                overlayColor:
                    MaterialStateProperty.all<Color>(Color(0xffffffff)),
                indicatorWeight: 5,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.yellow,
                indicatorColor: Colors.yellow,
                tabs: [
                  Tab(
                    icon: Icon(Icons.message),
                  ),
                  Tab(
                    icon: Icon(Icons.supervisor_account),
                  ),
                  Tab(
                    icon: Icon(Icons.account_circle),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: controllers(),
            ),
          ));
    }
  }

  List<Widget> controllers() {
    return [MessageController(), ContactController(), ProfilController()];
  }
}
