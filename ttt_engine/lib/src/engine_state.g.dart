// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engine_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EngineState extends EngineState {
  @override
  final int inLineCount;
  @override
  final BuiltList<FieldState> fields;
  @override
  final String gameId;
  @override
  final GameState gameState;
  @override
  final BuiltList<int> winnerFields;

  factory _$EngineState([void Function(EngineStateBuilder)? updates]) =>
      (new EngineStateBuilder()..update(updates))._build();

  _$EngineState._(
      {required this.inLineCount,
      required this.fields,
      required this.gameId,
      required this.gameState,
      required this.winnerFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        inLineCount, r'EngineState', 'inLineCount');
    BuiltValueNullFieldError.checkNotNull(fields, r'EngineState', 'fields');
    BuiltValueNullFieldError.checkNotNull(gameId, r'EngineState', 'gameId');
    BuiltValueNullFieldError.checkNotNull(
        gameState, r'EngineState', 'gameState');
    BuiltValueNullFieldError.checkNotNull(
        winnerFields, r'EngineState', 'winnerFields');
  }

  @override
  EngineState rebuild(void Function(EngineStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EngineStateBuilder toBuilder() => new EngineStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EngineState &&
        inLineCount == other.inLineCount &&
        fields == other.fields &&
        gameId == other.gameId &&
        gameState == other.gameState &&
        winnerFields == other.winnerFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, inLineCount.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, gameId.hashCode);
    _$hash = $jc(_$hash, gameState.hashCode);
    _$hash = $jc(_$hash, winnerFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EngineState')
          ..add('inLineCount', inLineCount)
          ..add('fields', fields)
          ..add('gameId', gameId)
          ..add('gameState', gameState)
          ..add('winnerFields', winnerFields))
        .toString();
  }
}

class EngineStateBuilder implements Builder<EngineState, EngineStateBuilder> {
  _$EngineState? _$v;

  int? _inLineCount;
  int? get inLineCount => _$this._inLineCount;
  set inLineCount(int? inLineCount) => _$this._inLineCount = inLineCount;

  ListBuilder<FieldState>? _fields;
  ListBuilder<FieldState> get fields =>
      _$this._fields ??= new ListBuilder<FieldState>();
  set fields(ListBuilder<FieldState>? fields) => _$this._fields = fields;

  String? _gameId;
  String? get gameId => _$this._gameId;
  set gameId(String? gameId) => _$this._gameId = gameId;

  GameState? _gameState;
  GameState? get gameState => _$this._gameState;
  set gameState(GameState? gameState) => _$this._gameState = gameState;

  ListBuilder<int>? _winnerFields;
  ListBuilder<int> get winnerFields =>
      _$this._winnerFields ??= new ListBuilder<int>();
  set winnerFields(ListBuilder<int>? winnerFields) =>
      _$this._winnerFields = winnerFields;

  EngineStateBuilder();

  EngineStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _inLineCount = $v.inLineCount;
      _fields = $v.fields.toBuilder();
      _gameId = $v.gameId;
      _gameState = $v.gameState;
      _winnerFields = $v.winnerFields.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EngineState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EngineState;
  }

  @override
  void update(void Function(EngineStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EngineState build() => _build();

  _$EngineState _build() {
    _$EngineState _$result;
    try {
      _$result = _$v ??
          new _$EngineState._(
              inLineCount: BuiltValueNullFieldError.checkNotNull(
                  inLineCount, r'EngineState', 'inLineCount'),
              fields: fields.build(),
              gameId: BuiltValueNullFieldError.checkNotNull(
                  gameId, r'EngineState', 'gameId'),
              gameState: BuiltValueNullFieldError.checkNotNull(
                  gameState, r'EngineState', 'gameState'),
              winnerFields: winnerFields.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();

        _$failedField = 'winnerFields';
        winnerFields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EngineState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
