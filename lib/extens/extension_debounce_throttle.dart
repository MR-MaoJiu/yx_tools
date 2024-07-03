import 'dart:async';

extension DebounceExtension<T, R> on Function(T) {
  /// 防抖
  /// [duration] 时间间隔
  Function(T) debounce(Duration duration) {
    Timer? timer;
    T? lastArgs;

    return (T args) {
      lastArgs = args;
      if (timer != null) {
        timer!.cancel();
      }
      timer = Timer(duration, () {
        this(lastArgs as T);
      });
    };
  }
}

extension ThrottleExtension<T, R> on Function(T) {
  /// 节流
  /// [duration] 时间间隔
  Function(T) throttle(Duration duration) {
    late T? lastArgs;
    late bool isThrottled = false;

    return (T args) {
      if (isThrottled) {
        lastArgs = args;
        return;
      }
      isThrottled = true;
      this(args);
      Timer(duration, () {
        isThrottled = false;
        if (lastArgs != null) {
          this(lastArgs!);
          lastArgs = null;
        }
      });
    };
  }
}
