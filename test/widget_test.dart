import 'package:flutter_test/flutter_test.dart';
import 'package:ttt_app_flowy/services/localization_service.dart';
import 'package:ttt_app_flowy/widgets/header/game_header.dart';
import 'package:ttt_engine/ttt_engine.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'testable_widget.dart';

void main() {
  testWidgets('standoff', (WidgetTester tester) async {
    await tester.pumpWidget(
      testableWidget(
        child: const GameHeader(gameState: GameState.standoff),
      ),
    );

    final localization = await AppLocalizations.delegate.load(
      LocalizationService.enLocale,
    );

    expect(find.text(localization.standoff), findsOneWidget);
  });
}
