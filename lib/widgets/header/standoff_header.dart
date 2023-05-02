import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';
import 'package:ttt_app_flowy/design_kit/ttt_texts.dart';
import 'package:ttt_app_flowy/services/localization_service.dart';
import 'package:ttt_app_flowy/widgets/marks/o_mark.dart';
import 'package:ttt_app_flowy/widgets/marks/x_mark.dart';

class StandoffHeader extends StatefulWidget {
  const StandoffHeader({super.key});

  @override
  State<StandoffHeader> createState() => _StandoffHeaderState();
}

class _StandoffHeaderState extends State<StandoffHeader>
    with LocalizationMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          localization.standoff,
          style: TTTTexts.titleText.copyWith(
            color: TTTColors.tableColor,
          ),
        ),
        SizedBox(height: 10.h),
        Opacity(
          opacity: 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20.w,
                height: 20.w,
                child: XMark(strokeWidth: 5.w),
              ),
              SizedBox(width: 20.w),
              SizedBox(
                width: 20.w,
                height: 20.w,
                child: OMark(strokeWidth: 5.w),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
