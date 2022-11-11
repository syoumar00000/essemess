import 'package:flutter/widgets.dart';

//padding
final kBodyPadding = EdgeInsets.all(14);

//sizebox for spacing between widget
final _defaultSpace = 10;
kSpaceH(double size) => SizedBox(
      height: size * _defaultSpace,
    );
kSpaceW(double size) => SizedBox(
      width: size * _defaultSpace,
    );

//size width, heigth
double kScreenWitdh(BuildContext context) => MediaQuery.of(context).size.width;
double kScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;
