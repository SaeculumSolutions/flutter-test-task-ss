import 'dart:math';

import 'package:flutter/material.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';

class CircularIndicator extends StatelessWidget {
  final double angle;
  final double width;

  const CircularIndicator(
      {super.key, required this.angle, required this.width});

  @override
  Widget build(BuildContext context) {
    // Convert the angle to radians
    double radians = (angle - 90) * (pi / 180.0);

    return CustomPaint(
      painter: CircularIndicatorPainter(angleInRadians: radians, width: width),
    );
  }
}

class CircularIndicatorPainter extends CustomPainter {
  final double angleInRadians;
  final double width;

  CircularIndicatorPainter({required this.angleInRadians, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;
    Paint backgroundPain = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    double centerX = 0;
    double centerY = 0;
    double radius = min(width, 205) / 2;

    // Draw the circle
    canvas.drawCircle(Offset(centerX, centerY), radius, backgroundPain);

    // Calculate the position for the indicator
    double indicatorX = centerX + radius * cos(angleInRadians);
    double indicatorY = centerY + radius * sin(angleInRadians);

    // Draw the indicator
    canvas.drawCircle(Offset(indicatorX, indicatorY), 4, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
