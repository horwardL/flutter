import 'dart:async';

import 'package:calendar_view_widget/calendar_view_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calendar Widget Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  StreamController<List<Map<String, String>>> eventsController =
      new StreamController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void dispose() {
    eventsController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const eventList = [
      // null location, so location will not be displayed
      // but event will be visible in calendar
      {
        'name': 'Event (null location)',
        'location': null,
        'date': '2019-09-27 13:27:00',
        'id': '1',
      },
      // null name, so name will not be displayed
      // but event will be visible in calendar
      {
        'name': null,
        'location': 'Suite 501',
        'date': '2019-09-21 14:35:00',
        'id': '2',
      },
      // null date, so event below will not be visible in calendar
      {
        'name': 'Event null date',
        'location': '1200 Park Avenue',
        'date': null,
        'id': '3',
      },
      // null id, so event below will not be visible in calendar
      {
        'name': 'Event null id',
        'location': 'Grand Ballroom',
        'date': '2019-08-27 13:27:00',
        'id': null,
      },
      {
        'name': 'Event 4',
        'location': 'Grand Ballroom',
        'date': '2019-08-27 13:27:00',
        'id': '4',
      },
      {
        'name': 'Event 5',
        'location': 'Suite 501',
        'date': '2019-10-21 14:35:00z',
        'id': '5',
      },
      {
        'name': 'Event 6',
        'location': '1200 Park Avenue',
        'date': '2019-08-22 05:49:00',
        'id': '6',
      },
      {
        'name':
            'Handle really long names in the event list so it does not break',
        'location': '1200 Park Avenue',
        'date': '2019-10-24 05:49:00',
        'id': '7',
      },
      {
        'name': 'Event 8',
        'location':
            'Handle really long locations in the event list so it does not break',
        'date': '2019-10-24 05:49:00z',
        'id': '8',
      },
    ];

    final theme = ThemeData.dark().copyWith(
      primaryColor: Colors.grey,
      accentColor: Colors.lightBlue,
      canvasColor: Colors.white,
      backgroundColor: Colors.lightBlue,
      dividerColor: Colors.blueGrey,
      textTheme: ThemeData.dark().textTheme.copyWith(
            display1: TextStyle(
              fontSize: 21.0,
            ),
            subhead: TextStyle(
              fontSize: 14.0,
              color: Colors.blueGrey,
            ),
            headline: TextStyle(
              fontSize: 18.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            title: TextStyle(
              fontSize: 14.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
      accentTextTheme: ThemeData.dark().accentTextTheme.copyWith(
            body1: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            title: TextStyle(
              fontSize: 21.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            display1: TextStyle(
              fontSize: 21.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
    );

    void onEventTapped(Map<String, String> event) {
      print(event);
    }

    eventsController.add(eventList);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // default String parameter values used below as example
            new CalendarView(
              onEventTapped: onEventTapped,
              titleField: 'name',
              detailField: 'location',
              dateField: 'date',
              separatorTitle: 'Events',
              theme: theme,
              eventStream: eventsController.stream,
            ),
          ],
        ),
      ),
    );
  }
}