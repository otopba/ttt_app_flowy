import 'package:test/test.dart';
import 'package:ttt_engine/src/game_state.dart';
import 'package:ttt_engine/src/ttt_engine.dart';

void main() {
  late TTTEngine engine;

  setUp(() {
    engine = TTTEngine();
    engine.newGame();
  });

  tearDown(() async {
    await engine.dispose();
  });

  test('1 row winner', () async {
    // | X |   |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(0);

    // | X |   |   |
    // | O |   |   |
    // |   |   |   |
    engine.makeTurn(3);

    // | X | X |   |
    // | O |   |   |
    // |   |   |   |
    engine.makeTurn(1);

    // | X | X |   |
    // | O | O |   |
    // |   |   |   |
    engine.makeTurn(4);

    // | X | X | X |
    // | O | O |   |
    // |   |   |   |
    engine.makeTurn(2);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });

  test('2 row winner', () async {
    // |   |   |   |
    // | X |   |   |
    // |   |   |   |
    engine.makeTurn(3);

    // | O |   |   |
    // | X |   |   |
    // |   |   |   |
    engine.makeTurn(0);

    // | O |   |   |
    // | X | X |   |
    // |   |   |   |
    engine.makeTurn(4);

    // | O | O |   |
    // | X | X |   |
    // |   |   |   |
    engine.makeTurn(1);

    // | O | O |   |
    // | X | X | X |
    // |   |   |   |
    engine.makeTurn(5);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });

  test('3 row winner', () async {
    // |   |   |   |
    // |   |   |   |
    // | X |   |   |
    engine.makeTurn(6);

    // | O |   |   |
    // |   |   |   |
    // | X |   |   |
    engine.makeTurn(0);

    // | O |   |   |
    // |   |   |   |
    // | X | X |   |
    engine.makeTurn(7);

    // | O | O |   |
    // |   |   |   |
    // | X | X |   |
    engine.makeTurn(1);

    // | O | O |   |
    // |   |   |   |
    // | X | X | X |
    engine.makeTurn(8);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });

  test('1 column winner', () async {
    // | X |   |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(0);

    // | X | O |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(1);

    // | X | O |   |
    // | X |   |   |
    // |   |   |   |
    engine.makeTurn(3);

    // | X | O |   |
    // | X | O |   |
    // |   |   |   |
    engine.makeTurn(4);

    // | X | O |   |
    // | X | O |   |
    // | X |   |   |
    engine.makeTurn(6);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });

  test('2 column winner', () async {
    // |   | X |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(1);

    // | O | X |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(0);

    // | O | X |   |
    // |   | X |   |
    // |   |   |   |
    engine.makeTurn(4);

    // | O | X |   |
    // | O | X |   |
    // |   |   |   |
    engine.makeTurn(3);

    // | O | X |   |
    // | O | X |   |
    // |   | X |   |
    engine.makeTurn(7);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });

  test('3 column winner', () async {
    // |   |   | X |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(2);

    // | O |   | X |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(0);

    // | O |   | X |
    // |   |   | X |
    // |   |   |   |
    engine.makeTurn(5);

    // | O |   | X |
    // | O |   | X |
    // |   |   |   |
    engine.makeTurn(3);

    // | O |   | X |
    // | O |   | X |
    // |   |   | X |
    engine.makeTurn(8);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });

  test('left diagonal winner', () async {
    // | X |   |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(0);

    // | X | O |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(1);

    // | X | O |   |
    // |   | X |   |
    // |   |   |   |
    engine.makeTurn(4);

    // | X | O | O |
    // |   | X |   |
    // |   |   |   |
    engine.makeTurn(2);

    // | X | O | O |
    // |   | X |   |
    // |   |   | X |
    engine.makeTurn(8);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });

  test('left diagonal winner', () async {
    // | X |   |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(0);

    // | X | O |   |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(1);

    // | X | O |   |
    // |   | X |   |
    // |   |   |   |
    engine.makeTurn(4);

    // | X | O | O |
    // |   | X |   |
    // |   |   |   |
    engine.makeTurn(2);

    // | X | O | O |
    // |   | X |   |
    // |   |   | X |
    engine.makeTurn(8);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });

  test('right diagonal winner', () async {
    // |   |   | X |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(2);

    // | O |   | X |
    // |   |   |   |
    // |   |   |   |
    engine.makeTurn(0);

    // | O |   | X |
    // |   | X |   |
    // |   |   |   |
    engine.makeTurn(4);

    // | O |   | X |
    // | O | X |   |
    // |   |   |   |
    engine.makeTurn(3);

    // | O |   | X |
    // | O | X |   |
    // | X |   |   |
    engine.makeTurn(6);

    final state = await engine.stateStream.first;
    expect(state.gameState, GameState.xWin);
  });
}
