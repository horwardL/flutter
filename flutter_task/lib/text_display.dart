import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget{
  final String randomText;

  TextDisplay({this.randomText = 'same text u fuck'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(randomText),
    );
  }
}