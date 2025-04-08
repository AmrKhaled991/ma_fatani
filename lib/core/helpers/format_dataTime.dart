import 'package:intl/intl.dart';

String getFormattedTime(DateTime? time) {
  var timeFormat = DateFormat("hh:mm a");
  String timePortion = timeFormat.format(time?.toLocal() ?? DateTime.now());
  return timePortion;
}
