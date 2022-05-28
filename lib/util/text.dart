import 'package:intl/intl.dart';

String getInitials(String name) {
  return name.trim().split(RegExp(' +')).map((n) => n[0]).take(2).join();
}

String currencyFormatter(int money) {
  final currencyFormatter = NumberFormat.currency(locale: 'ID', symbol: 'Rp');
  return currencyFormatter.format(money);
}
