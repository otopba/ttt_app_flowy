import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';
import 'package:ttt_app_flowy/design_kit/ttt_texts.dart';
import 'package:ttt_app_flowy/services/localization_service.dart';
import 'package:ttt_app_flowy/utils/throttler.dart';

class GameButton extends StatefulWidget {
  final VoidCallback? onPressed;

  const GameButton({super.key, this.onPressed});

  @override
  State<GameButton> createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> with LocalizationMixin {
  late final _clickThrottler = Throttler(_onPressed);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed == null ? null : _clickThrottler.throttle,
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all(Colors.red),
        // maximumSize: MaterialStateProperty.all(Size.infinite),
        minimumSize: MaterialStateProperty.all(Size(100.w, 20.h)),
      ),
      child: Text(
        localization.playAgain,
        style: TTTTexts.buttonStyle.copyWith(color: TTTColors.accentColor),
      ),
    );
  }

  void _onPressed() {
    widget.onPressed?.call();
  }
}
