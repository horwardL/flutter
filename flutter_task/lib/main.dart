import 'package:flutter/material.dart';

import './text_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Assignment 1'),
          ),
          body: TextController(),
      ),
    );
  }
}
