import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../utils/log/log_utils.dart';

const bool _inProduction = const bool.fromEnvironment("dart.vm.product");
const String TAG = "handle_exception : ";

void _reportError(dynamic e, StackTrace stack) {
  LogUtils.e('$TAG e---->$e');
  LogUtils.e('$TAG stack---->$stack');
}

String _stringify(Object exception) {
  try {
    return exception.toString();
  } catch (e) {
    // intentionally left empty.
  }
  return 'Error';
}

Widget _errorWidgetBuilder(FlutterErrorDetails details) {
  LogUtils.e(
      '$TAG _errorWidgetBuilder ${_stringify(details.exception)}${_stringify(details.stack ?? StackTrace.empty)}');
  String message = '';
  if (true) {
    message =
        '${_stringify(details.exception)}\nSee also: https://flutter.dev/docs/testing/errors';
  }
  final Object exception = details.exception;
  return ErrorWidget.withDetails(
      message: message, error: exception is FlutterError ? exception : null);
}

void hookCrash(Function main) {
  ErrorWidget.builder =
      (FlutterErrorDetails errorDetails) => _errorWidgetBuilder(errorDetails);
  if (_inProduction) {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Zone.current.handleUncaughtError(
          details.exception, details.stack ?? StackTrace.empty);
    };
  }

  runZoned<Future<void>>(
    () async {
      LogUtils.d('$TAG runZoned');
      main();
      LogUtils.d('$TAG runZoned main');
    },
    onError: (dynamic error, StackTrace stack) {
      //捕获异常打印日志
      _reportError(error, stack);
    },
  );
}
