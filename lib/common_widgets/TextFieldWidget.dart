import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.textInputType,
      this.inputFormatter});

  String hintText;
  final TextEditingController controller;
  TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        controller: controller..text,
        keyboardType: textInputType,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.3),
          hintText: hintText,
          labelText: hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
