import 'package:flutter/material.dart';

class CircularProgressPainter extends CustomPainter {
  final double progress;

  const CircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 6;

    final Paint circlePaint = Paint()
      ..color = Colors.grey.shade300 // Color for the background circle
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth; // Stroke width of the circle

    final Paint progressPaint = Paint()
      ..color = Colors.blue // Color for the progress circle
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Rounded ends for the stroke

    // Draw the background circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2 - strokeWidth / 2, circlePaint);

    double angle = 2 * 3.14159265359 * progress; // Calculate the angle for progress
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - strokeWidth / 2),
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
