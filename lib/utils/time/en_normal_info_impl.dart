import 'abs_time_info.dart';

class EnNormalInfo implements AbsTimelineInfo {
  @override
  String suffixAgo() => ' ago';

  @override
  String suffixAfter() => ' after';

  @override
  int maxJustNowSecond() => 30;

  @override
  String lessThanOneMinute() => 'just now';

  @override
  String customYesterday() => 'Yesterday';

  @override
  bool keepOneDay() => true;

  @override
  bool keepTwoDays() => false;

  @override
  String oneMinute(int minutes) => 'a minute';

  @override
  String minutes(int minutes) => '$minutes minutes';

  @override
  String anHour(int hours) => 'an hour';

  @override
  String hours(int hours) => '$hours hours';

  @override
  String oneDay(int days) => 'a day';

  @override
  String weeks(int week) => ''; //x week(星期x).

  @override
  String days(int days) => '$days days';
}
