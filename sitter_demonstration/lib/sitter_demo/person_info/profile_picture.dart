import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final String iconPath;

  ProfilePic({this.iconPath = 'assets/blank_profile_pic.png'});

  @override
  Widget build(BuildContext context) {
    return Center(child: GestureDetector(
      onTap: () {
        print("Profile Picture");
      },
      child: Container(
        width: 90.0,
        height: 90.0,
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
            image: ExactAssetImage(iconPath),
            //image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
          borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          border: new Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
    ));
  }
}
