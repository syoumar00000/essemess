import 'package:flutter/material.dart';
import 'package:igs/Screens/onboarding/onboarding_screen.dart';
import 'package:igs/config/app_config.dart';
import 'package:igs/styles/spacing_style.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    //initialize app startup data
    //future for fake load time
    Future.delayed(Duration(milliseconds: 3000), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      );
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEA5863),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            kAppLogo, //located in lib/configs/app-config.dart
            width: 150,
          ),
          kSpaceH(2),
          Text(
            kAppTitle, //located in lib/configs/app-config.dart
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          kSpaceH(4),
          const Spacer(),
          const LinearProgressIndicator(
            backgroundColor: Colors.white12,
            color: Colors.yellow,
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}
