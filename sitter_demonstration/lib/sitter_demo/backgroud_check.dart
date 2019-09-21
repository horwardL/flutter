import 'package:flutter/material.dart';

class BackgroudCheck extends StatefulWidget {
  BackgroudCheck(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _BackgroudCheck createState() => new _BackgroudCheck();
}

class _BackgroudCheck extends State<BackgroudCheck>
    with TickerProviderStateMixin<BackgroudCheck> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      Text(
        "My Backgourd",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
        ),
      ),
      new AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInExpo,
          child: new ConstrainedBox(
              constraints: widget.isExpanded
                  ? new BoxConstraints()
                  : new BoxConstraints(maxHeight: 65.0),
              child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: new Text(
                      widget.text,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                  )))),
      widget.isExpanded
          ? Container(
              height: 25.0,
              child: new FlatButton(
                  child: const Icon(Icons.expand_less),
                  onPressed: () => setState(() => widget.isExpanded = false)))
          : Container(
              height: 25.0,
              child: new FlatButton(
                  child: const Icon(Icons.expand_more),
                  onPressed: () => setState(() => widget.isExpanded = true)))
    ]);
  }
}
