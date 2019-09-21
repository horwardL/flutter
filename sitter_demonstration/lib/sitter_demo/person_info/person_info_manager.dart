import 'package:flutter/material.dart';

import './curve_painter.dart';
import './consts.dart';
import './profile_picture.dart';
import './profile_name.dart';
import './profile_address.dart';
import './age.dart';
import './star_rating.dart';
import './experience.dart';

class PersonInfoManager extends StatefulWidget {
  _PersonInfoManager createState() => _PersonInfoManager();
}

class _PersonInfoManager extends State<PersonInfoManager> {
  String name = "WoW LoL";
  String iconPath = "assets/crayon_shinchan.jpg";
  String address = "New York, NY";
  int age = 21;
  double rating = 4.5;
  int exp = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CustomPaint(
            child: Container(
              height: Consts.height,
            ),
            painter: CurvePainter(),
          ),
          Container(
            margin: MediaQuery.of(context).padding,
            child: Column(
              children: <Widget>[
                ProfilePic(iconPath: iconPath),
                ProFileName(name),
                ProfileAddress(address),
                Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Experience(exp),
                      StarRating(
                        rating: rating,
                        onRatingChanged: (rating) =>
                            setState(() => this.rating = rating),
                            color: Colors.yellow[600],
                      ),
                      Age(age),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              left: Consts.padding,
              right: Consts.padding,
              //0.65 when t equal 0.5 in cubic bezier curve
              top: Consts.height * 0.73,
              child: FloatingActionButton(
                onPressed: () {
                  print("add to favorite");
                },
                tooltip: '',
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: Consts.avatarRadius,
                ),
              )),
        ],
      ),
    );
  }
}
