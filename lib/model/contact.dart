import 'package:debting/model/debt.dart';
import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<Debt> lend;

  @HiveField(2)
  List<Debt> borrow;

  Contact({
    required this.name,
    required this.lend,
    required this.borrow,
  });

  int sumDebt() {
    int total = 0;

    for (var e in lend) {
      total += e.amount;
    }

    for (var e in borrow) {
      total -= e.amount;
    }

    return total;
  }
}
