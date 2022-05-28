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

  Debt deepCopy() {
    return Debt(amount: amount, date: date, desc: desc);
  }

  bool equals(Debt other) {
    return other.amount == amount && other.date == date && other.desc == desc;
  }
}
