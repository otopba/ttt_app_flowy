import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/design_kit/ttt_animations.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';
import 'package:ttt_app_flowy/utils/throttler.dart';
import 'package:ttt_app_flowy/widgets/marks/empty_mark.dart';
import 'package:ttt_app_flowy/widgets/marks/o_mark.dart';
import 'package:ttt_app_flowy/widgets/marks/x_mark.dart';
import 'package:ttt_engine/ttt_engine.dart';

class FieldItem extends StatefulWidget {
  const FieldItem({
    super.key,
    this.fieldState = FieldState.empty,
    this.winner = false,
    this.onPressed,
  });

  final FieldState fieldState;
  final bool winner;
  final VoidCallback? onPressed;

  @override
  State<FieldItem> createState() => _FieldItemState();
}

class _FieldItemState extends State<FieldItem> {
  late final _throttler = Throttler(_onPressed);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: widget.winner ? TTTColors.winnerColor : TTTColors.backgroundColor,
      duration: TTTAnimations.shortDuration,
      curve: TTTAnimations.onScreenCurve,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: widget.onPressed == null ? null : _throttler.throttle,
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: AnimatedOpacity(
              duration: TTTAnimations.shortDuration,
              curve: TTTAnimations.appearCurve,
              opacity: widget.fieldState == FieldState.empty ? 0.0 : 1.0,
              child: Container(
                key: ValueKey(widget.fieldState),
                child: widget.fieldState.icon(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    widget.onPressed?.call();
  }
}

extension FieldStateEx on FieldState {
  Widget icon() {
    switch (this) {
      case FieldState.empty:
        return const EmptyMark();
      case FieldState.xMark:
        return const XMark();
      case FieldState.oMark:
        return const OMark();
    }
  }
}
