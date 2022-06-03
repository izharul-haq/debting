import 'package:intl/intl.dart';

String currencyFormatter(int money) {
  final currencyFormatter = NumberFormat.currency(locale: 'ID', symbol: 'Rp');
  return currencyFormatter.format(money);
}
