import 'package:intl/intl.dart';

String getInitials(String name) =>
    name.trim().split(RegExp(' +')).map((n) => n[0]).take(2).join();

String currencyFormatter(int money) {
  final currencyFormatter = NumberFormat.currency(locale: 'ID');

  return currencyFormatter.format(money);
}
