import 'package:hive/hive.dart';

part 'debt.g.dart';

@HiveType(typeId: 1)
class Debt {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int amount;

  @HiveField(2)
  String desc;

  Debt({
    required this.date,
    required this.amount,
    required this.desc,
  });

  // Return a deep copy of this debt
  Debt get copy => Debt(amount: amount, desc: desc, date: date);

  // Check if this debt and the other debt are equal
  bool equals(Debt other) {
    return other.amount == amount && other.date == date && other.desc == desc;
  }
}

enum DebtType { lend, borrow }
