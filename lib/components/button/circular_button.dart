import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double size;
  final Function() onPressed;
  final Color color;
  final Widget icon;

  const CircularButton({
    Key? key,
    this.size = 30,
    required this.onPressed,
    this.color = Colors.black,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: CircleBorder(),
            backgroundColor: color),
        child: Center(child: icon),
        onPressed: onPressed,
      ),
    );
  }
}
