import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';

class XMark extends StatelessWidget {
  const XMark({
    super.key,
    this.strokeWidth,
  });

  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CrossPainter(
        color: TTTColors.xColor,
        strokeWidth: strokeWidth ?? 10.w,
      ),
      child: Container(),
    );
  }
}

class CrossPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  CrossPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );

    canvas.drawLine(
      Offset(size.width, 0),
      Offset(0, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CrossPainter oldDelegate) => oldDelegate.color != color;
}
