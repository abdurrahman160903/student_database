import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({
    super.key,
    required this.btnName,
    required this.click,
  });

  String btnName;
  VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      padding: EdgeInsets.all(10),
      child: TextButton(
        onPressed: click,
        child: Text(btnName),
        style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            textStyle:
                const TextStyle(fontSize: 18, fontStyle: FontStyle.normal)),
      ),
    );
  }
}
