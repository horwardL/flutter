import 'package:flutter/material.dart';

/* class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
} */

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.orange[800];
    paint.style = PaintingStyle.fill;

    Path path = Path();

    path.lineTo(0, size.height * 0.6);
    path.cubicTo(size.width * 0.25, size.height * 0.9, 
                 size.width * 0.75, size.height * 0.9, 
                 size.width, size.height * 0.6);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; 
}