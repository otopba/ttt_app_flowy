import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ttt_app_flowy/app.dart';
import 'package:ttt_app_flowy/di.dart';
import 'package:ttt_app_flowy/log.dart';

const _tag = 'main';

void main() {
  di.setup();

  runZonedGuarded<Future<void>>(
    () async {
      runApp(const TTTApp());
    },
    (Object e, StackTrace stackTrace) => Log.e(
      _tag,
      'runZonedGuarded: $e',
      stackTrace: stackTrace,
    ),
  );
}
