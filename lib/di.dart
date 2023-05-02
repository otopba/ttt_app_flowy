import 'package:get_it/get_it.dart';
import 'package:ttt_engine/ttt_engine.dart';

final di = GetIt.instance;

extension GetItEx on GetIt {
  void setup() {
    setupDi();
  }
}

void setupDi() {
  di.registerSingleton<TTTEngine>(
    TTTEngine(),
    dispose: (it) => it.dispose(),
  );
}
