import 'package:intl/intl.dart';

abstract class CurrencyUtils {
  static final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
  );

  static String format(int money) {
    return currencyFormatter.format(money);
  }
}
