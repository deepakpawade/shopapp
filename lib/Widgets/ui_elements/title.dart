import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  TitleText(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
    );
  }
}
