import 'package:debting/model/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

int getTotalDebt(Box box, {bool lend = false, bool borrow = false}) {
  int total = 0;

  if (box.isNotEmpty) {
    for (int i = 0; i < box.length; i++) {
      total += (box.getAt(i) as Contact).sumDebt(
        countLend: lend,
        countBorrow: borrow,
      );
    }
  }

  return total;
}
