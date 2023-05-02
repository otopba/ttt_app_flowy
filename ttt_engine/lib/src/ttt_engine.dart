import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ttt_engine/ttt_engine.dart';
import 'package:uuid/uuid.dart';

typedef _IndexTransformer = int Function(int i, int j);

class TTTEngine {
  static const int inLineCount = 3;
  final _stateSubject = BehaviorSubject<EngineState>();

  Stream<EngineState> get stateStream => _stateSubject;

  Future<void> dispose() {
    return _stateSubject.close();
  }

  void newGame() {
    _stateSubject.add(
      EngineState(
        (b) => b
          ..inLineCount = inLineCount
          ..fields = List.filled(inLineCount * inLineCount, FieldState.empty)
              .toBuiltList()
              .toBuilder()
          ..gameState = GameState.xTurn
          ..gameId = Uuid().v4(),
      ),
    );
  }

  void makeTurn(int index) {
    final currentGame = _stateSubject.valueOrNull;

    if (currentGame == null) return;
    if (index < 0) return;
    if (index >= currentGame.fields.length) return;

    final gameState = currentGame.gameState;
    if (gameState != GameState.xTurn && gameState != GameState.oTurn) return;

    final field = currentGame.fields[index];

    if (field != FieldState.empty) return;

    final newFields = currentGame.fields.rebuild(
      (b) => b
        ..replaceRange(
          index,
          index + 1,
          [
            gameState == GameState.xTurn ? FieldState.xMark : FieldState.oMark,
          ],
        ),
    );
    final turnResult = _processTurn(fields: newFields, gameState: gameState);

    _stateSubject.add(
      currentGame.rebuild(
        (b) => b
          ..fields = newFields.toBuilder()
          ..gameState = turnResult.gameState
          ..winnerFields = turnResult.winnerFields.toBuilder(),
      ),
    );
  }

  _TurnResult _processTurn({
    required BuiltList<FieldState> fields,
    required GameState gameState,
  }) {
    final rowWinner = _isXWinsInDoubleLoop(
      fields: fields,
      indexTransformer: (i, j) => i * inLineCount + j,
    );
    if (rowWinner != null) return rowWinner.toTurnResult();

    final columnWinner = _isXWinsInDoubleLoop(
      fields: fields,
      indexTransformer: (i, j) => i + j * inLineCount,
    );
    if (columnWinner != null) return columnWinner.toTurnResult();

    final leftDiagonalWinner = _isXWinsInLoop(
      i: 0,
      fields: fields,
      indexTransformer: (i, j) => j * inLineCount + j,
    );
    if (leftDiagonalWinner != null) return leftDiagonalWinner.toTurnResult();

    final rightDiagonalWinner = _isXWinsInLoop(
      i: 0,
      fields: fields,
      indexTransformer: (i, j) => inLineCount + inLineCount * j - (j + 1),
    );
    if (rightDiagonalWinner != null) return rightDiagonalWinner.toTurnResult();

    final isStandoff = !fields.any((it) => it == FieldState.empty);

    if (isStandoff) return _TurnResult.noWinners(GameState.standoff);

    return _TurnResult.noWinners(
      gameState == GameState.xTurn ? GameState.oTurn : GameState.xTurn,
    );
  }

  _LoopWinner? _isXWinsInDoubleLoop({
    required BuiltList<FieldState> fields,
    required _IndexTransformer indexTransformer,
  }) {
    for (int i = 0; i < inLineCount; i++) {
      final xWinner = _isXWinsInLoop(
        i: i,
        fields: fields,
        indexTransformer: indexTransformer,
      );
      if (xWinner != null) return xWinner;
    }

    return null;
  }

  _LoopWinner? _isXWinsInLoop({
    required int i,
    required BuiltList<FieldState> fields,
    required _IndexTransformer indexTransformer,
  }) {
    int xSum = 0;
    int oSum = 0;
    final indexBuilder = ListBuilder<int>();

    for (int j = 0; j < inLineCount; j++) {
      final realIndex = indexTransformer(i, j);

      final value = fields[realIndex];
      if (value == FieldState.xMark) {
        xSum++;
      } else if (value == FieldState.oMark) {
        oSum++;
      }

      indexBuilder.add(realIndex);
    }

    if (xSum == inLineCount) {
      return _LoopWinner(xWin: true, winnerFields: indexBuilder.build());
    } else if (oSum == inLineCount) {
      return _LoopWinner(xWin: false, winnerFields: indexBuilder.build());
    }

    return null;
  }
}

class _LoopWinner {
  final bool xWin;
  final BuiltList<int> winnerFields;

  _LoopWinner({
    required this.xWin,
    required this.winnerFields,
  });

  _TurnResult toTurnResult() {
    return _TurnResult(
      gameState: xWin ? GameState.xWin : GameState.oWin,
      winnerFields: winnerFields,
    );
  }
}

class _TurnResult {
  final GameState gameState;
  final BuiltList<int> winnerFields;

  _TurnResult({
    required this.gameState,
    required this.winnerFields,
  });

  _TurnResult.noWinners(this.gameState) : winnerFields = BuiltList<int>();
}
