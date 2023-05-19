import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ttt_app_flowy/design_kit/ttt_colors.dart';
import 'package:ttt_app_flowy/pages/game/game_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttt_app_flowy/services/localization_service.dart';

class TTTApp extends StatelessWidget {
  const TTTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // https://github.com/flutter/flutter/issues/126585
      useInheritedMediaQuery: true,
      scaleByHeight: kIsWeb,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: LocalizationService.localizationsDelegates,
          supportedLocales: LocalizationService.supportedLocales,
          onGenerateTitle: (context) => context.localization.appTitle,
          localeListResolutionCallback:
              LocalizationService.localeListResolutionCallback,
          home: const GamePage(),
          theme: ThemeData(
            primarySwatch: TTTColors.primarySwatch,
          ),
        );
      },
    );
  }
}
