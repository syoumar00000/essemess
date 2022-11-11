import 'package:flutter/material.dart';
import 'package:igs/Screens/authentication/signin_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pages = [
    PageViewModel(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Communicate with",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          Text(
            " ...",
            style: TextStyle(color: Color(0XFFEA5863), fontSize: 25),
          ),
        ],
      ),
      body:
          "Chat with your friends, family, collegue, world for free anytime, anywhere",
      image: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
        child: Center(
          child: Image.asset(
            "assets/landing1.png",
            height: 279.0,
          ),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFF2F2F2),
        bodyTextStyle: TextStyle(color: Color(0XFF211A44), fontSize: 16),
        titleTextStyle: TextStyle(color: Color(0XFF211A44), fontSize: 24),
      ),
    ),
    PageViewModel(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Talk to the",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          Text(
            " World",
            style: TextStyle(color: Color(0XFFEA5863), fontSize: 25),
          ),
        ],
      ),
      body: "Chat with the world for free anytime, anywhere",
      image: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
        child: Center(
          child: Image.asset(
            "assets/landing2.png",
            height: 279.0,
          ),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFF2F2F2),
        bodyTextStyle: TextStyle(color: Color(0XFF211A44), fontSize: 16),
        titleTextStyle: TextStyle(color: Color(0XFF211A44), fontSize: 24),
      ),
    ),
    PageViewModel(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Talk to your",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          Text(
            " Family",
            style: TextStyle(color: Color(0XFFEA5863), fontSize: 25),
          ),
        ],
      ),
      body: "Chat with your family for free anytime, anywhere",
      image: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
        child: Center(
          child: Image.asset(
            "assets/landing3.png",
            height: 279.0,
          ),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFF2F2F2),
        bodyTextStyle: TextStyle(color: Color(0XFF211A44), fontSize: 16),
        titleTextStyle: TextStyle(color: Color(0XFF211A44), fontSize: 24),
      ),
    ),
    PageViewModel(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Talk to the",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          Text(
            " Collegues",
            style: TextStyle(color: Color(0XFFEA5863), fontSize: 25),
          ),
        ],
      ),
      body: "Chat with your collegue for free anytime, anywhere",
      image: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
        child: Center(
          child: Image.asset(
            "assets/landing4.png",
            height: 279.0,
          ),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFF2F2F2),
        bodyTextStyle: TextStyle(color: Color(0XFF211A44), fontSize: 16),
        titleTextStyle: TextStyle(color: Color(0XFF211A44), fontSize: 24),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: IntroductionScreen(
          globalBackgroundColor: const Color(0xFFF2F2F2),
          pages: pages,
          onDone: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignInScreen()));
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          onSkip: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          showSkipButton: true,
          skip: const Icon(
            Icons.skip_previous,
            color: Color(0XFF211A44),
          ),
          next: const Icon(
            Icons.skip_next,
            color: Color(0XFF211A44),
          ),
          done: const Text(
            "Done",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0XFFEA5863),
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Color(0XFFEA5863),
            color: Color(0xFF9A9FAD),
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
