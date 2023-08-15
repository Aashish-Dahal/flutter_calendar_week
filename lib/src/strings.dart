import 'package:intl/intl.dart';

/// Length of day of week
final int maxDayOfWeek = 7;

/// List contain day of week
const List<String> dayOfWeekDefault = [
  'MON',
  'TUE',
  'WED',
  'THU',
  'FRI',
  'SAT',
  'SUN'
];

/// List contain day of week
const List<String> JpDayOfWeekDefault = ['月', '火', '水', '木', '金', '土', '日'];

/// List contain titles month
const List<String> monthDefaults = [
  'JANUARY',
  'FEBRUARY',
  'MARCH',
  'APRIL',
  'MAY',
  'JUNE',
  'JULY',
  'AUGUST',
  'SEPTEMBER',
  'OCTOBER',
  'NOVEMBER',
  'DECEMBER'
];

const List<int> weekendsIndexesDefault = [5, 6];
DateTime currentDate = DateTime.now();
DateTime startOfWeekday = DateTime.now();
DateTime endOfWeekday = DateTime.now();
int totalWeek = 0;

Map<String, dynamic> calculateWeekday(
    [bool next = false, DateTime? previousDate]) {
  // Subtract the number of days to get to the previous weekday
  DateTime weekday = next
      ? previousDate!.add(Duration(days: totalWeek))
      : currentDate.subtract(Duration(days: totalWeek));

  // Find the start of the week (Monday) for the previous weekday
  DateTime start = weekday.subtract(Duration(days: weekday.weekday - 1));

  // Find the end of the week (Friday) for the previous weekday
  DateTime end = start.add(const Duration(days: 6));

  startOfWeekday = start;
  endOfWeekday = end;
  totalWeek += 7;
  return {
    "start_date": DateFormat('yyyy-MM-dd').format(startOfWeekday),
    "end_date": DateFormat('yyyy-MM-dd').format(endOfWeekday),
  };
}

Map<String, dynamic> calculateStartAndEndDates(int year, int month) {
  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

  return {
    'start_date': DateFormat('yyyy-MM-dd').format(firstDayOfMonth),
    'end_date': DateFormat('yyyy-MM-dd').format(lastDayOfMonth)
  };
}
