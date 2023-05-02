import 'package:flutter/cupertino.dart';
import 'package:ttt_app_flowy/design_kit/ttt_animations.dart';
import 'package:ttt_app_flowy/widgets/header/standoff_header.dart';
import 'package:ttt_app_flowy/widgets/header/turn_header.dart';
import 'package:ttt_app_flowy/widgets/header/win_header.dart';
import 'package:ttt_engine/ttt_engine.dart';

class GameHeader extends StatelessWidget {
  final GameState gameState;

  const GameHeader({
    super.key,
    required this.gameState,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: TTTAnimations.duration,
      switchInCurve: TTTAnimations.appearCurve,
      switchOutCurve: TTTAnimations.disappearCurve,
      child: gameState.widget(),
    );
  }
}

extension GameStateEx on GameState {
  Widget widget() {
    switch (this) {
      case GameState.xTurn:
        return const TurnHeader(xTurn: true);
      case GameState.oTurn:
        return const TurnHeader(xTurn: false);
      case GameState.xWin:
        return const WinHeader(xWin: true);
      case GameState.oWin:
        return const WinHeader(xWin: false);
      case GameState.standoff:
        return const StandoffHeader();
    }
  }
}
