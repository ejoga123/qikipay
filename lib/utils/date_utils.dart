import 'package:intl/intl.dart';

class DateUtils {
  static String getWeekdayName(DateTime date) {
    return DateFormat.EEEE().format(date); // e.g. Monday
  }

  static int daysBetween(DateTime start, DateTime end) {
    return end.difference(start).inDays;
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String countdownTo(DateTime target) {
    final now = DateTime.now();
    final diff = target.difference(now);
    if (diff.isNegative) return 'Expired';
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    final minutes = diff.inMinutes % 60;
    return '$days days, $hours hrs, $minutes mins left';
  }

  static DateTime dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static String formatRange(DateTime start, DateTime end) {
    final formatter = DateFormat('dd MMM yyyy');
    return '${formatter.format(start)} → ${formatter.format(end)}';
  }
}
