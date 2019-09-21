import 'package:flutter/material.dart';

import './person_info/person_info_manager.dart';
import './description.dart';
import './backgroud_check.dart';
import './floating_action_Button.dart';

class SitterDemo extends StatelessWidget {
  SitterDemo({Key key, this.title}) : super(key: key);

  final String title;
  final String descp =
      "heheheheheheh about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!about me!";
  final String backgroud =
      "elementary graduated\nelementary graduated\nelementary graduated\nelementary graduated\n";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
          margin: MediaQuery.of(context).padding,
          child: Column(
            children: <Widget>[
              PersonInfoManager(),
              Container(
                height: 1,
                color: Colors.black12,
              ),
              Description(descp),
              Container(
                height: 1,
                color: Colors.black12,
              ),
              BackgroudCheck(backgroud),
              Container(
                height: 1,
                color: Colors.black12,
              ),


              GestureDetector(
                  onTap: () {
                    print("Go to schedule");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Schedule",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 30.0,
                      ),
                    ],
                  )),


              Container(
                height: 1,
                color: Colors.black12,
              ),



              Column(
                children: <Widget>[
                  Text(
                    "Employment Infomation",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Text(
                          "Job Type",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      Text(
                          "Full Time",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Text(
                          "Hourly Rate",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      Text(
                          "\$15-\$50",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                    ],
                  )
                ],
              )
            ],
          ),
        )), // This trailing comma makes auto-formatting nicer for build methods.
        floatingActionButton: FancyFab());
  }
}
