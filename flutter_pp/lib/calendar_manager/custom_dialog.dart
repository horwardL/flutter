import 'package:flutter/material.dart';

import 'consts.dart';

class CustomDialog extends StatelessWidget {
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
              child: Container(
                  //child: ListView(),
              )
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              radius: Consts.avatarRadius,
              child: Text('2'),
            ),
          ),
        ])
    );
  }
}
