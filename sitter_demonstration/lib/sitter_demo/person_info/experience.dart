import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  final int exp;

  Experience(this.exp);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.09),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Text(
              exp.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Text(
              ' yrs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ]),
          Text(
            "Exp.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
