import 'package:debting/models/debt.dart';
import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  String name;

  @HiveField(1)
  String? phone;

  @HiveField(2)
  List<Debt> lend;

  @HiveField(3)
  List<Debt> borrow;

  Contact({
    required this.name,
    this.phone,
    required this.lend,
    required this.borrow,
  });

  // Get a dummy contact instance
  static Contact get dummy => Contact(name: 'John Doe', lend: [], borrow: []);

  // Get initial from contact name.
  // Initial is formed from first character
  // from each word and max two characters.
  String get initials =>
      name.trim().split(RegExp(' +')).map((n) => n[0]).take(2).join();

  // Calculate sum of debt.
  // Calculation is based on included
  // list of debt (lend or borrow).
  int sum({bool includeLend = false, bool includeBorrow = false}) {
    int total = 0;

    if (includeLend) total += lend.fold(0, (prev, e) => prev + e.amount);
    if (includeBorrow) total -= lend.fold(0, (prev, e) => prev + e.amount);

    return total;
  }
}
