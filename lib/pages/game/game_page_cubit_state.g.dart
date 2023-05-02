// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_page_cubit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GamePageCubitState extends GamePageCubitState {
  @override
  final EngineState? engineState;

  factory _$GamePageCubitState(
          [void Function(GamePageCubitStateBuilder)? updates]) =>
      (new GamePageCubitStateBuilder()..update(updates))._build();

  _$GamePageCubitState._({this.engineState}) : super._();

  @override
  GamePageCubitState rebuild(
          void Function(GamePageCubitStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GamePageCubitStateBuilder toBuilder() =>
      new GamePageCubitStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GamePageCubitState && engineState == other.engineState;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, engineState.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GamePageCubitState')
          ..add('engineState', engineState))
        .toString();
  }
}

class GamePageCubitStateBuilder
    implements Builder<GamePageCubitState, GamePageCubitStateBuilder> {
  _$GamePageCubitState? _$v;

  EngineStateBuilder? _engineState;
  EngineStateBuilder get engineState =>
      _$this._engineState ??= new EngineStateBuilder();
  set engineState(EngineStateBuilder? engineState) =>
      _$this._engineState = engineState;

  GamePageCubitStateBuilder();

  GamePageCubitStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _engineState = $v.engineState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GamePageCubitState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GamePageCubitState;
  }

  @override
  void update(void Function(GamePageCubitStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GamePageCubitState build() => _build();

  _$GamePageCubitState _build() {
    _$GamePageCubitState _$result;
    try {
      _$result =
          _$v ?? new _$GamePageCubitState._(engineState: _engineState?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'engineState';
        _engineState?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GamePageCubitState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
