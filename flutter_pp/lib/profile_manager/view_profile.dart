import 'package:flutter/material.dart';

class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("Tapped View Profile");
        },
        child: Text("View Profile"),
      ),
    );
  }
}
