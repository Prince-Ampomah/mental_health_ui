import 'package:intl/intl.dart';

class DateTimeConvertor {
  DateTimeConvertor._();

  static String greetingTime() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 16) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  static List<DateTime> generateWeek() {
    final today = DateTime.now();

    return List.generate(
      7,
      (index) => today.subtract(Duration(days: 3)).add(Duration(days: index)),
    );
  }

  static String formatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  static String getDateFromInt(int time) {
    final date = DateTime.fromMillisecondsSinceEpoch(time);
    return DateFormat.E().add_MMM().add_jm().format(date).toString();
  }

  static String getFormattedDate(DateTime time) {
    return DateFormat.E().add_MMM().add_jm().format(time).toString();
  }

  static String getHoursMinsTimeEpoch(int date) {
    var format = DateFormat('hh:mm a');
    var getDate = DateTime.fromMillisecondsSinceEpoch(date);
    return format.format(getDate);
  }

  static String getDayMonthAndYearFromEpoch(int date) {
    var dateFormat = DateFormat('dd MMMM, yyyy');
    return dateFormat.format(DateTime.fromMicrosecondsSinceEpoch(date));
  }

  static String getDayMonthYearAndTimeFromEpoch(int date) {
    var dateFormat = DateFormat('dd MMMM, yyyy : hh:mm a');
    return dateFormat.format(DateTime.fromMicrosecondsSinceEpoch(date));
  }

  static String getFormattedHoursMinTime(DateTime time) {
    var format = DateFormat('hh:mm a'); // MMMM d
    return format.format(time);
  }

  static String getFormattedMonthAndDay(DateTime time) {
    var format = DateFormat('MMMM d'); //Month and Day (July 10)
    return format.format(time);
  }

  static String getDayMonthAndYear(DateTime dateTime) {
    return DateFormat('dd MMMM, yyyy').format(dateTime);
  }

  static String getDueDateFormat(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy  hh:mm a').format(dateTime);
  }

  static String getHeaderDate(DateTime dateTime) {
    return DateFormat('EEEE MMM, dd').format(dateTime);
  }

  static String getDayMonthAndYearNumericals(DateTime dateTime) {
    return DateFormat('dd/M/yyyy').format(dateTime);
  }

  static String formatAudioTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  static String calcuateTimeDifference(DateTime dateToCheck) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final messageDate = DateTime(
      dateToCheck.year,
      dateToCheck.month,
      dateToCheck.day,
    );
    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM d, y').format(dateToCheck);
    }
  }

  static String calcuateChatTimeDifference(DateTime dateToCheck) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final messageDate = DateTime(
      dateToCheck.year,
      dateToCheck.month,
      dateToCheck.day,
    );
    if (messageDate == today) {
      return 'Today ${DateFormat('h:mm a').format(dateToCheck)}';
    } else if (messageDate == yesterday) {
      return 'Yesterday ${DateFormat('h:mm a').format(dateToCheck)}';
    } else {
      return DateFormat('MMMM d, h:mm a').format(dateToCheck);
    }
  }

  static String reportTime(DateTime dateToCheck) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final messageDate = DateTime(
      dateToCheck.year,
      dateToCheck.month,
      dateToCheck.day,
    );
    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM d').format(dateToCheck);
    }
  }

  static String calcuateTimeDiffernceEpoch(int dateToCheck) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final messageDate = DateTime(
      DateTime.fromMicrosecondsSinceEpoch(dateToCheck).year,
      DateTime.fromMicrosecondsSinceEpoch(dateToCheck).month,
      DateTime.fromMicrosecondsSinceEpoch(dateToCheck).day,
    );
    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat(
        'MMMM d, y',
      ).format(DateTime.fromMicrosecondsSinceEpoch(dateToCheck));
    }
  }

  static String friendlyTime(DateTime time, {DateTime? now}) {
    final current = now ?? DateTime.now();
    var diff = current.difference(time);

    // Guard: future timestamp -> just show calendar date
    if (diff.isNegative) return DateFormat('MMM d').format(time);

    if (diff.inSeconds < 45) return 'Just now';
    if (diff.inMinutes < 60) {
      final m = diff.inMinutes;
      return '$m min${m == 1 ? '' : 's'} ago';
    }
    if (diff.inHours < 24) {
      final h = diff.inHours;
      return '$h hour${h == 1 ? '' : 's'} ago';
    }

    // >= 1 day -> calendar style: "Sep 7"
    return DateFormat('MMM d').format(time);
  }
}
