import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String iconPath;

  ProfileIcon(this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: InkWell(
            onTap: () {
              print('Clicked Profile Pic');
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(iconPath),
                /*child: Image.network(
                    'https://pbs.twimg.com/profile_images/463700853094768640/y9EDl_xS_400x400.png')
                    */
            )
        )
    );
  }
}
