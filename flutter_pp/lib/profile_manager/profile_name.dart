import 'package:flutter/material.dart';

class ProFileName extends StatelessWidget {
  final String firstName;

  ProFileName(this.firstName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        firstName,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
