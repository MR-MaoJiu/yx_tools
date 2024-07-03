import 'abs_time_info.dart';

class ZhNormalInfo implements AbsTimelineInfo {
  @override
  String suffixAgo() => '前';

  @override
  String suffixAfter() => '后';

  @override
  int maxJustNowSecond() => 30;

  @override
  String lessThanOneMinute() => '刚刚';

  @override
  String customYesterday() => '昨天';

  @override
  bool keepOneDay() => true;

  @override
  bool keepTwoDays() => false;

  @override
  String oneMinute(int minutes) => '$minutes分钟';

  @override
  String minutes(int minutes) => '$minutes分钟';

  @override
  String anHour(int hours) => '$hours小时';

  @override
  String hours(int hours) => '$hours小时';

  @override
  String oneDay(int days) => '$days天';

  @override
  String weeks(int week) => ''; //x week(星期x).

  @override
  String days(int days) => '$days天';
}
