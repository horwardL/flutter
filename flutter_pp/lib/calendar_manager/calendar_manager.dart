import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'custom_dialog.dart';

class CalendarManager extends StatefulWidget {
  @override
  _CalendarManager createState() => _CalendarManager();
}

class _CalendarManager extends State<CalendarManager> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  CalendarCarousel _calendarCarouselNoHeader;
  String _currentMonth = '';

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 9, 5): [
        new Event(
          date: new DateTime(2019, 9, 5, 14, 30),
          title: 'Event 1',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2019, 9, 5, 15, 30),
          title: 'Event 2',
          icon: _eventIcon,
        ),
      ],
      new DateTime(2019, 9, 7): [
        new Event(
          date: new DateTime(2019, 9, 7, 12),
          title: 'Event 1',
          icon: _eventIcon,
        ),
      ],
    },
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        //events.forEach((event) => print(event.title));
        showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog());
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      markedDatesMap: _markedDateMap,
      height: 416.5,
      selectedDateTime: _currentDate2,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
          false, // null for not showing hidden events indicator
      showHeader: true, //month
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      todayButtonColor: Colors.orange,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 60)),
      maxSelectedDate: _currentDate.add(Duration(days: 60)),
//      inactiveDateColor: Colors.black12,
      /* onCalendarChanged: (DateTime date) {
        this.setState(() => _currentMonth = DateFormat.yMMM().format(date));
      }, */

      daysHaveCircularBorder: true,
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: _calendarCarouselNoHeader,
      /* CalendarCarousel(

          //current: DateTime.now(),
          onDayPressed: (DateTime date, List<Event> events) {
            this.setState(() => _currentDate = date);
            events.forEach((event) => print(event.title + ", Date: " + event.date.toString()));
          },
          thisMonthDayBorderColor: Colors.grey,
          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: true, /// null for not rendering any border, true for circular border, false for rectangular border
          markedDatesMap: _markedDateMap,
          isScrollable: true,
          //          weekendStyle: TextStyle(
          //            color: Colors.red,
          //          ),
          //          weekDays: null, /// for pass null when you do not want to render weekDays
          //          headerText: Container( /// Example for rendering custom header
          //            child: Text('Custom Header'),
          //          ),
        ) */
    );
  }
}
