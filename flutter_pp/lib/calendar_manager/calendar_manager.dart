import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import 'custom_dialog.dart';

class CalendarManager extends StatefulWidget {
  final Stream<List<Map<String, String>>> eventStream;
  final List<Map<String, String>> eventList;

  CalendarManager({this.eventStream, this.eventList});

  @override
  _CalendarManager createState() => _CalendarManager();
}

class _CalendarManager extends State<CalendarManager> {
  int _currentMonth;
  int _currentYear;
  int _currentDay;
  Map<int, Map<int, Map<int, List>>> _events;
  EventList<Event> _markedDateMap;
  /*  = new EventList<Event>(
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
    ); */

  @override
  initState() {
    super.initState();
    widget.eventStream.listen(_setEvents);
    _currentMonth = DateTime.now().month;
    _currentYear = DateTime.now().year;
    _currentDay = 0;
  }

  /// Processes events and sets state for events in calendar
  /// Used by initState to initialize widget
  /// and to update widget when needed
  void _setEvents(List<Map<String, String>> events) {
    List<Map<String, String>> filteredEvents = List.from(events);
    filteredEvents
        .removeWhere((Map<String, String> event) => !_validEvent(event));

    // sort events based on date field
    final sortedEvents = List.from(filteredEvents);
    sortedEvents.sort((a, b) => a['date'].compareTo(b['date']));
    //Map<DateTime, List<Event>> _even = new Map();

    Map<int, Map<int, Map<int, List>>> structuredEvents = {};
    for (var event in sortedEvents) {
      //var title = event['title'];
      var date = DateTime.parse(event['date']).toLocal();
      // guard null date
      if (date == null) {
        continue;
      }

      //if(!_even.containsKey(date)){
      //  _even[new DateTime(date.year, date.month, date.day, date.hour, date.minute, date.second)] = new List<Event>();
      //}
      //_even[date].add(new Event(date: date, title: title, icon:_eventIcon));

      Map year = structuredEvents[date.year];
      // guard null year
      if (year == null) {
        structuredEvents[date.year] = {
          date.month: {
            date.day: [event]
          }
        };
        continue;
      }

      Map month = year[date.month];
      // guard null month
      if (month == null) {
        structuredEvents[date.year][date.month] = {
          date.day: [event]
        };
        continue;
      }

      List day = month[date.day];
      // guard null day
      if (day == null) {
        structuredEvents[date.year][date.month][date.day] = [event];
        continue;
      }

      day.add(event);
      structuredEvents[date.year][date.month][date.day] = day;
    }
    //_markedDateMap = new EventList<Event>(events: _even);
    setState(() => _events = structuredEvents);
  }

  bool _validEvent(Map<String, String> event) =>
      event['date'] != null && event['date'].isNotEmpty;

  DateTime _currentDate2 = DateTime.now();
  CalendarCarousel _calendarCarouselNoHeader;

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white.withOpacity(0.65),
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber.withOpacity(0.65),
    ),
  );

  EventList<Event> _getMarkedDateMap() {
    List<Map<String, String>> filteredEvents = List.from(widget.eventList);
    filteredEvents
        .removeWhere((Map<String, String> event) => !_validEvent(event));

    // sort events based on date field
    final sortedEvents = List.from(filteredEvents);
    sortedEvents.sort((a, b) => a['date'].compareTo(b['date']));
    //EventList<Event> _markedDateMap;
    var title;
    var date;
    Map<DateTime, List<Event>> _events = new Map();

    for (var event in sortedEvents) {
      title = event['title'];
      date = DateTime.parse(event['date']).toLocal();

      if (date == null) {
        continue;
      }

      DateTime day = new DateTime(date.year, date.month, date.day);

      if (!_events.containsKey(day)) {
        _events[day] = new List<Event>();
      }
      _events[day].add(new Event(date: date, title: title, icon: _eventIcon));
    }

    return new EventList<Event>(events: _events);
  }

  @override
  Widget build(BuildContext context) {
    _markedDateMap = _getMarkedDateMap();
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        showDialog(
            context: context,
            builder: (BuildContext context) => Center(
              child: CustomDialog(
                  currentYear: date.year,
                  currentMonth: date.month,
                  currentDay: date.day,
                  events: _events,
              ),
            ));
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
      //minSelectedDate: _currentDate.subtract(Duration(days: 60)),
      //maxSelectedDate: _currentDate.add(Duration(days: 60)),
      //inactiveDateColor: Colors.black12,
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
