import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm');
  return formatter.format(dateTime);
}

String textShorter(String text, maxLength) {
  return text.length >= maxLength ? '${text.substring(0, maxLength)}...' : text;
}
