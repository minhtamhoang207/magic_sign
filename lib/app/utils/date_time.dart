import 'package:intl/intl.dart';

class AppDateTime {
  static String formatDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('hh:mm dd/MM/yyyy').format(date);
  }
}
