import 'package:intl/intl.dart';

class CurrencyUtils {
  static final _formatter = NumberFormat.currency(locale: 'ID', symbol: 'Rp');

  static String format(int money) {
    return _formatter.format(money);
  }
}
