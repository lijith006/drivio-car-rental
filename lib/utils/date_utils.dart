import 'package:intl/intl.dart';

class DateUtilsHelper {
  static String formatDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy, hh:mm a').format(date);
  }

  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
