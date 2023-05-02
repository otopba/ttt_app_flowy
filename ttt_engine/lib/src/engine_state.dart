import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:ttt_engine/src/field_state.dart';
import 'package:ttt_engine/src/game_state.dart';

part 'engine_state.g.dart';

abstract class EngineState implements Built<EngineState, EngineStateBuilder> {
  factory EngineState([void Function(EngineStateBuilder) updates]) =
      _$EngineState;

  EngineState._();

  int get inLineCount;

  BuiltList<FieldState> get fields;

  String get gameId;

  GameState get gameState;

  BuiltList<int> get winnerFields;
}
