import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/design_kit/ttt_animations.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';
import 'package:ttt_app_flowy/log.dart';
import 'package:ttt_app_flowy/widgets/field/filed_item.dart';
import 'package:ttt_engine/ttt_engine.dart';

const _tag = 'field';

class Field extends StatefulWidget {
  const Field({
    super.key,
    required this.inLineCount,
    required this.fields,
    required this.winnerFields,
    required this.gameId,
    required this.onFieldPressed,
  });

  final int inLineCount;
  final BuiltList<FieldState> fields;
  final BuiltList<int> winnerFields;
  final String gameId;
  final ValueSetter<int> onFieldPressed;

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> with TickerProviderStateMixin {
  late final AnimationController _videoScaleAnimationController;
  late final Animation<double> _videoScaleAnimation;

  late final AnimationController _opacityAnimationController;
  late final Animation<double> _opacityAnimation;

  late BuiltList<FieldState> _fields = widget.fields;
  late BuiltList<int> _winnerFields = widget.winnerFields;

  @override
  void initState() {
    super.initState();
    _videoScaleAnimationController = AnimationController(
      duration: TTTAnimations.duration,
      vsync: this,
    );
    _videoScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 0.9,
    ).animate(
      CurvedAnimation(
        parent: _videoScaleAnimationController,
        curve: TTTAnimations.appearCurve,
      ),
    );
    _opacityAnimationController = AnimationController(
      duration: TTTAnimations.shortDuration,
      vsync: this,
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _opacityAnimationController,
        curve: TTTAnimations.appearCurve,
        reverseCurve: TTTAnimations.disappearCurve,
      ),
    );

    _videoScaleAnimationController.forward();
    _opacityAnimationController.forward();
  }

  @override
  void didUpdateWidget(Field oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.gameId != widget.gameId) {
      _opacityAnimationController.reverse().then((value) {
        if (!mounted) return;

        setState(() {
          _fields = widget.fields;
          _winnerFields = widget.winnerFields;
        });

        _videoScaleAnimationController.reset();
        _videoScaleAnimationController.forward();
        _opacityAnimationController.forward();
      });
    } else {
      _fields = widget.fields;
      _winnerFields = widget.winnerFields;
    }
  }

  @override
  void dispose() {
    _videoScaleAnimationController.dispose();
    _opacityAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Stack(
          children: [
            Positioned.fill(
              child: ScaleTransition(
                scale: _videoScaleAnimation,
                child: Container(color: TTTColors.tableColor),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.inLineCount,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.w,
              ),
              itemBuilder: _itemBuilder,
              itemCount: widget.inLineCount * widget.inLineCount,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final FieldState fieldState;
    if (index < 0) {
      fieldState = FieldState.empty;
    } else if (index >= _fields.length) {
      fieldState = FieldState.empty;
    } else {
      fieldState = _fields[index];
    }

    return FieldItem(
      key: ValueKey('field_$index'),
      fieldState: fieldState,
      winner: _winnerFields.contains(index),
      onPressed:
          fieldState == FieldState.empty ? () => _onFieldPressed(index) : null,
    );
  }

  void _onFieldPressed(int index) {
    Log.d(_tag, '_onFieldPressed: index = $index');

    widget.onFieldPressed(index);
  }
}
