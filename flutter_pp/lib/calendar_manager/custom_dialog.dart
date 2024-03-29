import 'package:flutter/material.dart';

import 'consts.dart';
import 'appointment_view.dart';

class CustomDialog extends StatelessWidget {
  final int currentMonth;
  final int currentYear;
  final int currentDay;
  final Map<int, Map<int, Map<int, List>>> events;

  CustomDialog({
    this.currentYear,
    this.currentMonth,
    this.currentDay,
    this.events,
  });

  Map<int, List> _monthlyEvents() {
    if (events != null && events[currentYear] != null) {
      final yearEvents = events[currentYear];
      if (yearEvents[currentMonth] != null) {
        return yearEvents[currentMonth];
      }
    }
    return {};
  }

  _onEventTapped(Map<String, String> event) {
    print(event);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.padding),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                top: Consts.avatarRadius + Consts.padding,
                bottom: Consts.padding,
                left: Consts.padding,
                right: Consts.padding,
              ),
              margin: EdgeInsets.only(top: Consts.avatarRadius),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Consts.padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: AppointmentView(
                events: _monthlyEvents(),
                currentDay: currentDay,
                titleField: 'title',
                detailField: 'description',
                dateField: 'date',
                onAppTapped: _onEventTapped,
              )),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              radius: Consts.avatarRadius,
              child: Text(
                currentDay.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
            ),
          ),
        ]));
  }
}
