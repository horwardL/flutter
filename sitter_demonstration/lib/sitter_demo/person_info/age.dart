import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  final int age;

  Age(this.age);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.09),
      child: Column(
        children: <Widget>[
          Text(
            age.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          Text(
            "Age",
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
