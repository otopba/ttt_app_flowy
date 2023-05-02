import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:ttt_app_flowy/log.dart';

const _tag = 'localization_service';

typedef LocalizedString = String Function(AppLocalizations appLocalizations);

class LocalizationService {
  static const enLocale = Locale('en', '');
  static const ruLocale = Locale('ru', '');

  static const defaultLocale = enLocale;

  static const supportedLocales = [
    enLocale,
    ruLocale,
  ];

  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Locale? localeListResolutionCallback(
    List<Locale>? locales,
    Iterable<Locale> supportedLocales,
  ) {
    final locale = basicLocaleListResolution(locales, supportedLocales);
    Log.d(_tag, "Set locale $locale");
    return locale;
  }

  Future<AppLocalizations> getLocalization({Locale? locale}) {
    return AppLocalizations.delegate.load(locale ?? defaultLocale);
  }
}

extension ContextAppLocale on BuildContext {
  AppLocalizations get localization =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
}

mixin LocalizationMixin<T extends StatefulWidget> on State<T> {
  late AppLocalizations _localizations;

  @protected
  AppLocalizations get localization => _localizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = context.localization;
  }
}
