import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/// Example
/// --dart-define=BUILT_TYPE=debug
final BuildConfig buildConfig = _getBuiltConfig();

BuildConfig _getBuiltConfig() {
  const buildTypeValue = String.fromEnvironment(
    'BUILT_TYPE',
    defaultValue: 'debug',
  );

  final builtType = BuiltType.values
          .firstWhereOrNull((it) => describeEnum(it) == buildTypeValue) ??
      BuiltType.debug;

  switch (builtType) {
    case BuiltType.debug:
      return BuildConfig.debug;
    case BuiltType.test:
      return BuildConfig.test;
    case BuiltType.release:
      return BuildConfig.release;
  }
}

enum BuiltType {
  debug,
  test,
  release,
}

class BuildConfig {
  BuildConfig({
    required this.printLogsEnabled,
    required this.forcePrintLogs,
  });

  final bool printLogsEnabled;
  final bool forcePrintLogs;

  static final test = BuildConfig(
    printLogsEnabled: true,
    forcePrintLogs: true,
  );

  static final debug = BuildConfig(
    printLogsEnabled: true,
    forcePrintLogs: false,
  );

  static final release = BuildConfig(
    printLogsEnabled: false,
    forcePrintLogs: false,
  );
}
