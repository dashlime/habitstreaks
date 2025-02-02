import 'package:flutter/material.dart';
import 'package:habitstreaks/view/theme/colors.dart';

class CircularProgressPainter extends CustomPainter {
  final double progress;

  const CircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 6;

    final center = Offset(size.width / 2, size.height / 2);

    final Paint circlePaint = Paint()
      ..color = UiColors.backgroundGray // Color for the background circle
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth; // Stroke width of the circle

    final Paint progressPaint = Paint()
      ..shader = blueGradient.createShader(Rect.fromCenter(center: center, width: size.width, height: size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Rounded ends for the stroke

    // Draw the background circle
    canvas.drawCircle(center, size.width / 2 - strokeWidth / 2, circlePaint);

    double angle = 2 * 3.14159265359 * progress; // Calculate the angle for progress
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2 - strokeWidth / 2),
      -3.14159265359 / 2, // Start angle (top of the circle)
      angle, // Sweep angle based on the progress
      false, // Do not connect the start and end points
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
