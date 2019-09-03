import 'package:flutter/material.dart';
import 'dart:math';

import './text_display.dart';

class TextController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TextControllerState();
  }
}

class _TextControllerState extends State<TextController>{
  String _random_text = 'random text';
  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _random_text = '';
                for(var i = 0; i < 15; ++i){
                  _random_text += String.fromCharCode(65 + _random.nextInt(123-65));
                } 
              });
            },
            child: Text('Magic'),
          ),
        ),
        TextDisplay(randomText : _random_text)
      ],
    );
  }
  }