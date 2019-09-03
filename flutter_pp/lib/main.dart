import 'package:flutter/material.dart';

import './profile_manager/profile_manager.dart';
import './calendar_manager/calendar_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: <Widget>[
              ProfileManager(
                firstName: 'Bob',
              ),
              CalendarManager()
            ],
          ),
        ));
  }
}