import 'package:intl/intl.dart';

String formatDate(String date) {
  final formatDate = DateTime.parse(date);

  final String finalDate = DateFormat('dd/MM/yyy').format(formatDate);

  return finalDate;
}
