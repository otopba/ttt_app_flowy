import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ttt_app_flowy/app.dart';
import 'package:ttt_app_flowy/di.dart';
import 'package:ttt_app_flowy/services/localization_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  group(
    'game',
    () {
      testWidgets(
        'game finished',
        (tester) async {
          final binding =
              IntegrationTestWidgetsFlutterBinding.ensureInitialized();
          binding.framePolicy =
              LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

          di.setup();

          await tester.pumpWidget(const TTTApp());
          await tester.pumpAndSettle();

          // | X |   |   |
          // |   |   |   |
          // |   |   |   |
          await tester.tap(find.byKey(const ValueKey('field_0')));
          await tester.pumpAndSettle();

          // | X |   |   |
          // | O |   |   |
          // |   |   |   |
          await tester.tap(find.byKey(const ValueKey('field_3')));
          await tester.pumpAndSettle();

          // | X | X |   |
          // | O |   |   |
          // |   |   |   |
          await tester.tap(find.byKey(const ValueKey('field_1')));
          await tester.pumpAndSettle();

          // | X | X |   |
          // | O | O |   |
          // |   |   |   |
          await tester.tap(find.byKey(const ValueKey('field_4')));
          await tester.pumpAndSettle();

          // | X | X | X |
          // | O | O |   |
          // |   |   |   |
          await tester.tap(find.byKey(const ValueKey('field_2')));
          await tester.pumpAndSettle();

          final localization = await AppLocalizations.delegate.load(
            LocalizationService.enLocale,
          );

          expect(find.text(localization.theWinnerIs), findsOneWidget);
        },
      );
    },
  );
}
