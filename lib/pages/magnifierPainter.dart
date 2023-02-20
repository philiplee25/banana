import 'package:flutter/material.dart';

class MagnifierPainter extends CustomPainter {
  final double strokenWidth;
  final Color color;
  const MagnifierPainter({this.strokenWidth = 5, this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokenWidth
      ..color = color;

    canvas.drawCircle(
        size.center(Offset(0, 0)), size.longestSide / 2, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
