import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';
import 'package:ttt_app_flowy/log.dart';
import 'package:ttt_app_flowy/pages/game/game_page_cubit.dart';
import 'package:ttt_app_flowy/pages/game/game_page_cubit_state.dart';
import 'package:ttt_app_flowy/services/localization_service.dart';
import 'package:ttt_app_flowy/widgets/field/field.dart';
import 'package:ttt_app_flowy/widgets/game_button.dart';
import 'package:ttt_app_flowy/widgets/header/game_header.dart';

const _tag = 'game_page';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with LocalizationMixin {
  final _cubit = GamePageCubit();

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamePageCubit, GamePageCubitState>(
      bloc: _cubit,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, GamePageCubitState state) {
    final engineState = state.engineState;

    return Scaffold(
      backgroundColor: TTTColors.backgroundColor,
      body: SafeArea(
        child: engineState == null
            ? const Center(
                child: CircularProgressIndicator(color: TTTColors.tableColor),
              )
            : Column(
                children: [
                  SizedBox(height: 40.h),
                  GameHeader(
                    gameState: engineState.gameState,
                    key: const ValueKey('game_header'),
                  ),
                  const Spacer(),
                  Field(
                    fields: engineState.fields,
                    winnerFields: engineState.winnerFields,
                    inLineCount: engineState.inLineCount,
                    gameId: engineState.gameId,
                    onFieldPressed: _onFieldPressed,
                  ),
                  const Spacer(),
                  GameButton(onPressed: _onPlayAgainPressed),
                  SizedBox(height: 40.h),
                ],
              ),
      ),
    );
  }

  void _onPlayAgainPressed() {
    Log.d(_tag, '_onPlayAgainPressed');

    _cubit.restart();
  }

  void _onFieldPressed(int index) {
    Log.d(_tag, '_onFieldPressed: index = index');

    _cubit.makeTurn(index);
  }
}
