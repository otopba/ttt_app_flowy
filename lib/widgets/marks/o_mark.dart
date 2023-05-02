import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';

class OMark extends StatelessWidget {
  const OMark({
    super.key,
    this.strokeWidth,
  });

  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: TTTColors.oColor,
          width: strokeWidth ?? 10.w,
        ),
      ),
    );
  }
}
