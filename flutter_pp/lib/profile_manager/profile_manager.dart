import 'package:flutter/material.dart';

import './profile_icon.dart';
import './profile_name.dart';
import './view_profile.dart';

class ProfileManager extends StatefulWidget{
  final String firstName, icon;

  ProfileManager({this.firstName = 'First name',
                  this.icon = 'assets/blank_profile_pic.png'});

  @override
  _ProfileManager createState() => _ProfileManager();
}

class _ProfileManager extends State<ProfileManager> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: MediaQuery.of(context).padding,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                spreadRadius: -10.0,
                offset: Offset(0.0, 8.0))
          ],
        ),


        child: Row(children: [
          ProfileIcon(widget.icon),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,


                children: <Widget>[
                  ProFileName(widget.firstName),
                  ViewProfile()
                ],
              ))
        ]));
  }
}
