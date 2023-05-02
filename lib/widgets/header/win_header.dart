import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/design_kit/ttt_animations.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';
import 'package:ttt_app_flowy/design_kit/ttt_texts.dart';
import 'package:ttt_app_flowy/services/localization_service.dart';
import 'package:ttt_app_flowy/widgets/marks/o_mark.dart';
import 'package:ttt_app_flowy/widgets/marks/x_mark.dart';

class WinHeader extends StatefulWidget {
  final bool xWin;

  const WinHeader({super.key, required this.xWin});

  @override
  State<WinHeader> createState() => _WinHeaderState();
}

class _WinHeaderState extends State<WinHeader> with LocalizationMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          localization.theWinnerIs,
          style: TTTTexts.titleText.copyWith(
            color: TTTColors.tableColor,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 20.w,
          height: 20.w,
          child: Opacity(
            opacity: 0.5,
            child: AnimatedSwitcher(
              duration: TTTAnimations.shortDuration,
              switchInCurve: TTTAnimations.appearCurve,
              switchOutCurve: TTTAnimations.disappearCurve,
              child: widget.xWin
                  ? XMark(strokeWidth: 5.w)
                  : OMark(strokeWidth: 5.w),
            ),
          ),
        ),
      ],
    );
  }
}
