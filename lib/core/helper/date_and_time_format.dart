import 'package:intl/intl.dart';

class DateAndTimeFormat {
  static String dateAndTimeFormat(DateTime pickedDate) {
    return DateFormat("yyyy-MM-dd").format(pickedDate);
  }
}
