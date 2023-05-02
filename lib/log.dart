import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:ttt_app_flowy/build_options.dart';

enum LogLevel {
  d,
  w,
  e,
}

typedef LogPrinter = void Function(LogItem item);

class Log {
  static void d(String tag, Object? message) {
    log(LogLevel.d, tag, message);
  }

  static void w(String tag, Object? message) {
    log(LogLevel.w, tag, message);
  }

  static void e(String tag, Object? message, {StackTrace? stackTrace}) {
    log(LogLevel.e, tag, message, stackTrace: stackTrace);
  }

  static void log(
    LogLevel level,
    String tag,
    Object? message, {
    StackTrace? stackTrace,
  }) {
    if (!buildConfig.printLogsEnabled) return;

    final now = DateTime.now();
    final isolateName = kIsWeb ? 'main' : Isolate.current.debugName;

    final logItem = LogItem(
      level: level,
      date: now,
      tag: tag,
      message: '$message',
      isolateName: isolateName,
      stackTrace: stackTrace,
    );

    if (buildConfig.forcePrintLogs) {
      debugPrintSynchronously('$logItem');
    } else {
      debugPrint('$logItem');
    }
  }
}

class LogItem {
  LogItem({
    required this.level,
    required this.date,
    required this.tag,
    required this.message,
    required this.isolateName,
    this.stackTrace,
  });

  static const _dateFormatString = 'dd-MM-yyyy–HH:mm:ss:ms';
  static final _dateFormat = DateFormat(_dateFormatString);

  final LogLevel level;
  final DateTime date;
  final String tag;
  final String message;
  final String? isolateName;
  final StackTrace? stackTrace;

  @override
  String toString() {
    var result =
        '${describeEnum(level).toUpperCase()}/${_dateFormat.format(date)} [$isolateName] $tag: $message';
    if (stackTrace != null) {
      result += '\n$stackTrace';
    }
    return result;
  }
}
