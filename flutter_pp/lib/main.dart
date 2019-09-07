import 'dart:async';
import 'package:flutter/material.dart';

import './profile_manager/profile_manager.dart';
import './calendar_manager/calendar_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<List<Map<String, String>>> eventsController = new StreamController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const eventList = [
      // null description, so description will not be displayed
      // but event will be visible in calendar
      {
        'title': 'Event (null description)',
        'description': null,
        'date': '2019-09-27 13:27:00',
        'id': '1',
      },
      // null title, so title will not be displayed
      // but event will be visible in calendar
      {
        'title': null,
        'description': 'description 501',
        'date': '2019-09-21 14:35:00',
        'id': '2',
      },
      // null date, so event below will not be visible in calendar
      {
        'title': 'Event null date',
        'description': '1200 description',
        'date': null,
        'id': '3',
      },
      // null id, so event below will not be visible in calendar
      {
        'title': 'Event null id',
        'description': 'Grand description',
        'date': '2019-08-27 13:27:00',
        'id': null,
      },
      {
        'title': 'Event 4',
        'description': 'Grand description',
        'date': '2019-08-27 13:27:00',
        'id': '4',
      },
      {
        'title': 'Event 5',
        'description': 'description 501',
        'date': '2019-10-21 14:35:00z',
        'id': '5',
      },
      {
        'title': 'Event 6',
        'description': '1200 description',
        'date': '2019-08-22 05:49:00',
        'id': '6',
      },
      {
        'title':
            'Handle really long names in the event list so it does not break',
        'description': '1200 description',
        'date': '2019-10-24 16:49:00',
        'id': '7',
      },
      {
        'title': 'Event 8',
        'description':
            'Handle really long descriptions in the event list so it does not break',
        'date': '2019-10-24 05:49:00z',
        'id': '8',
      },
    ];
    eventsController.add(eventList);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: <Widget>[
              ProfileManager(
                firstName: 'Bob',
              ),
              CalendarManager(
                eventList: eventList,
                eventStream: eventsController.stream,
              )
            ],
          ),
        ));
  }
}
