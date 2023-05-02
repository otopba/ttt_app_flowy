import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttt_app_flowy/di.dart';
import 'package:ttt_app_flowy/log.dart';
import 'package:ttt_app_flowy/pages/game/game_page_cubit_state.dart';
import 'package:ttt_engine/ttt_engine.dart';

const _tag = 'premium_compare_page_cubit';

class GamePageCubit extends Cubit<GamePageCubitState> {
  GamePageCubit()
      : _engine = di.get(),
        super(GamePageCubitState()) {
    _init();
  }

  final TTTEngine _engine;
  late final StreamSubscription _engineSubscription;

  void _init() {
    Log.d(_tag, '_init');

    _engineSubscription = _engine.stateStream.listen(_onEngineState);

    _engine.newGame();
  }

  @override
  Future<void> close() async {
    await super.close();
    await _engineSubscription.cancel();
  }

  void _onEngineState(EngineState engineState) {
    if (isClosed) return;

    emit(state.rebuild((b) => b..engineState = engineState.toBuilder()));
  }

  void restart() {
    _engine.newGame();
  }

  void makeTurn(int index) {
    _engine.makeTurn(index);
  }
}
