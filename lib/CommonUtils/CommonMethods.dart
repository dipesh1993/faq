import 'package:intl/intl.dart';


String getCurrentDate(String outputFormat) {
  DateTime date = DateTime.now();
  DateFormat dateFormat = DateFormat(outputFormat);
  String formattedDate = dateFormat.format(date);
  return formattedDate;
}