import 'dart:core';
import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final String? labelText;
  final String? placeholder;
  final Function? validator;
  final Function? onSaved;
  final Function? onVisiblePassword;
  final bool? isText;
  final bool? isEmail;
  final bool? isNumber;
  final bool? isRequired;
  final bool? showPassword;
  final int? minlength;
  final dynamic icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final TextInputType? type;
  const MyTextfield({
    Key? key,
    this.minlength,
    this.showPassword,
    this.placeholder,
    this.validator,
    this.isEmail,
    this.isNumber,
    this.isRequired,
    this.isText,
    this.onSaved,
    this.onVisiblePassword,
    this.labelText,
    this.icon,
    this.controller,
    this.type,
    this.isPassword,
  }) : super(key: key);

  @override
  _MyTextfieldState createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: (widget.isPassword!)
              ? GestureDetector(
                  onTap: widget.onVisiblePassword!(),
                  child: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : Icon(
                  Icons.remove_red_eye,
                  color: Colors.white10,
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icons.edit == false
              ? null
              : Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 24,
                ),
          // labelText: labelText,
          hintText: widget.labelText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        onSaved: (String? value) {
          value = value;
        },
        controller: widget.controller,
        // obscureText: (widget.isPassword!) ? widget.showPassword! : false,
        keyboardType: widget.type,
      ),
    );
  }
}
