import 'package:flutter/material.dart';

class MyIconButtonWidget extends IconButton {
  MyIconButtonWidget(
      {required Icon icon,
      required VoidCallback onPressed,
      FontWeight fontweight: FontWeight.bold,
      Color? color,
      @required size})
      : super(
          icon: icon,
          onPressed: onPressed,
          color: color,
          iconSize: size,
        );
}
