import 'package:built_value/built_value.dart';
import 'package:ttt_engine/ttt_engine.dart';

part 'game_page_cubit_state.g.dart';

abstract class GamePageCubitState
    implements Built<GamePageCubitState, GamePageCubitStateBuilder> {
  factory GamePageCubitState(
          [void Function(GamePageCubitStateBuilder) updates]) =
      _$GamePageCubitState;

  GamePageCubitState._();

  EngineState? get engineState;
}
