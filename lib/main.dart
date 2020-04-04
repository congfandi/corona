/*
 * corona
 * main.dart
 * Created by Cong Fandi on 15/3/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

import 'app/app_my.dart';

final SentryClient sentry = new SentryClient(
    dsn: "https://32f89c05d61043d685b2bd6d3496e4be@sentry.io/5187880");

void main() async {
  runZoned(
    () => runApp(MyApp()),
    onError: (Object error, StackTrace stackTrace) {
      try {
        sentry.captureException(
          exception: error,
          stackTrace: stackTrace,
        );
        print('Error sent to sentry.io: $error');
      } catch (e) {
        print('Sending report to sentry.io failed: $e');
        print('Original error: $error');
      }
    },
  );
  FlutterError.onError = (details, {bool forceReport = false}) {
    try {
      sentry.captureException(
        exception: details.exception,
        stackTrace: details.stack,
      );
    } catch (e) {
      print('Sending report to sentry.io failed: $e');
    } finally {
      // Also use Flutter's pretty error logging to the device's console.
      FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
    }
  };
}
