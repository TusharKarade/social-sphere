import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String dateString, {String format = 'dd-MM-yyyy'}) {
    try {
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(dateString);
      return DateFormat(format).format(parsedDate);
    } catch (e) {
      print(e);
      return dateString;
    }
  }
}
