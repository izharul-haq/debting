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

  @HiveField(3, defaultValue: false)
  bool paid;

  Debt({
    required this.date,
    required this.amount,
    required this.desc,
    this.paid = false,
  });

  void isPaid() {
    paid = !paid;
  }
}
