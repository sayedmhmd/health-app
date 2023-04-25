import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GraphPainter extends CustomPainter {
  const GraphPainter({
    required this.currentPoint,
    required this.shadowPath,
    required this.followPath,
    this.comparePath,
    required this.graphSize,
  });

  final Offset currentPoint;
  final Path shadowPath;
  final Path followPath;
  final Path? comparePath;
  final double graphSize;

  static final backgroundPaint = Paint()
    ..color = const Color.fromARGB(255, 252, 250, 250);
  static final currentPointPaint = Paint()..color = Colors.black87;
  static final shadowPaint = Paint()
    ..color = const Color.fromARGB(255, 0, 0, 0)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  static final comparePaint = Paint()
    ..color = Colors.green[500]!
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  // static final followPaint = Paint()
  //   ..color = Colors.blue
  //   ..style = PaintingStyle.stroke
  //   ..strokeWidth = 4;
  static final borderPaint = Paint()
    ..color = const Color.fromARGB(255, 0, 0, 0)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    canvas.translate(
        //25, -150);
        size.width / 2 - graphSize / 2,
        -0.h);
    //size.height / 2 - graphSize / 2);
    _drawBorder(canvas, size);
    _drawBorderAll(canvas, size);
    canvas.translate(0, 16.h);
    if (comparePath != null) {
      canvas.drawPath(comparePath!, comparePaint);
    }
    canvas
      ..drawPath(shadowPath, shadowPaint)
      //   ..drawPath(followPath, followPaint)
      ..drawCircle(
          Offset(currentPoint.dx, -currentPoint.dy), 12, currentPointPaint);
  }

  void _drawBackground(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);
  }

  void _drawBorder(Canvas canvas, Size size) {
    canvas
      ..drawLine(const Offset(0, 150), const Offset(0, 150), borderPaint)
      ..drawLine(Offset(0, 16.3.h), Offset(graphSize, 16.5.h),
          borderPaint); //graphSize
  }

  void _drawBorderAll(Canvas canvas, Size size) {
    /// x
    canvas
      ..drawLine(const Offset(0, 150), const Offset(0, 150), borderPaint)
      ..drawLine(
          Offset(0, 32.h), Offset(graphSize, 32.h), borderPaint) //graphSize

      ////////////////////////
      ..drawLine(const Offset(0, 150), const Offset(0, 150), borderPaint)
      ..drawLine(
          Offset(0, 0.h), Offset(graphSize, 0.h), borderPaint) //graphSize

///// y
      ..drawLine(const Offset(150, 0), const Offset(150, 0), borderPaint)
      ..drawLine(Offset(0, 0), Offset(0, 32.h), borderPaint) //graphSize

      ////////////////////////
      ..drawLine(const Offset(150, 0), const Offset(150, 0), borderPaint)
      ..drawLine(Offset(graphSize, 0), Offset(graphSize, 32.h),
          borderPaint); //graphSize
  }

///////////////// x, y -----x,y
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
