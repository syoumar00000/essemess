import 'package:flutter/material.dart';
import 'package:igs/styles/spacing_style.dart';
import 'package:igs/styles/text_style.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Color color;
  final Widget child;
  final int img;

  const AuthenticationLayout(
      {Key? key,
      required this.title,
      required this.color,
      this.subTitle,
      required this.img,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: (img) == 1
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
                  child: Image.asset(
                    "assets/logo.png",
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                )
              : Image.asset(
                  "assets/landing3.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 220),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: kScreenHeight(context),
              width: kScreenWitdh(context),
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 0),
              // decoration: BoxDecoration(
              //   color: color,
              //   borderRadius: const BorderRadius.only(
              //     topLeft: Radius.circular(40),
              //     topRight: Radius.circular(40),
              //   ),
              // ),

              child: Container(
                height: kScreenHeight(context),
                width: kScreenWitdh(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSpaceH(2),
                    Text(
                      title,
                      style: kHeadline6(context)?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0XFFEA5863)),
                    ),
                    //kSpaceH(0.5),
                    // Text(
                    //subTitle,
                    // ),
                    // kSpaceH(3.5),
                    child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
