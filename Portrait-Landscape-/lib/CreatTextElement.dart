import 'package:flutter/material.dart';

class CreatTextElement extends StatelessWidget {
  final String inputtext;
  CreatTextElement(this.inputtext);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(inputtext),
      height: 44,
      padding: const EdgeInsets.only(left: 20),
    );
  }
}
