import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentView extends StatelessWidget {
  final Map<int, List> events;
  final int currentDay;
  final String titleField;
  final String detailField;
  final String dateField;
  final Function onAppTapped;

  AppointmentView(
      {this.events,
      this.currentDay,
      this.titleField,
      this.detailField,
      this.dateField,
      this.onAppTapped});

  String timeString(event) {
    final date = DateTime.parse(event[dateField]).toLocal();
    return DateFormat.jm().format(date);
  }

  Widget eventRow(int day, Map<String, String> event) => InkWell(
        onTap: () => onAppTapped(event),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          //padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      event[titleField] ?? "",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      event[detailField] ?? "",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      timeString(event),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
              /* Expanded(
                child: Container(),
              ),
              dateBadge(day), */
            ],
          ),
        ),
      );

  List<Widget> _appointmentList() {
    List<Widget> list = [];
    events.forEach((int day, List dayEvents) {
      if (currentDay == 0 || currentDay == day) {
        for (var i = 0; i < dayEvents.length; i++) {
          list.add(eventRow(day, dayEvents[i]));
          list.add(Divider(
            color: Colors.orange,
            height: 0.0,
          ));
        }
      }
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: ListView(
              children: _appointmentList(),
            ),
          ),
        ),
      ],
    ));
  }
}
