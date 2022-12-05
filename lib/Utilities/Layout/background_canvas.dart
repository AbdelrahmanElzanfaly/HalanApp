import 'dart:ui';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Theme/theme.dart';
import 'dart:math' as math;

class CanvasBackground extends StatelessWidget {
  final Widget child;
  const CanvasBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 425.w,
          height: 1000.h,
          decoration: BoxDecoration(
            gradient: ThemeClass.screenGradient,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CustomPaint(
            painter: OvalCanvas(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.w, sigmaY: 15.w),
              child: Container(decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),),
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class OvalCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()..color = const Color(0xffF0C929).withOpacity(0.25)
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.translate(size.width * 0.5, size.height * 0.5);
    canvas.rotate(-math.pi / 1.7);
    canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: 300.w, height: 800.h), circlePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}