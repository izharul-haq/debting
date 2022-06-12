import 'package:debting/models/contact.dart';
import 'package:debting/models/debt.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var key = '';
  var contact = Contact.dummy;

  void select(String key, Contact contact) {
    this.key = key;
    this.contact = contact;

    update();
  }

  void updateContact({
    String? name,
    String? phone,
    List<Debt>? lend,
    List<Debt>? borrow,
  }) {
    if (name != null) contact.name = name;
    if (phone != null) contact.phone = phone != '' ? phone : null;
    if (lend != null) contact.lend = lend;
    if (borrow != null) contact.borrow = borrow;

    update();
  }

  void addDebt(
    DebtType type, {
    required String amount,
    required String desc,
    required String date,
  }) {
    if (type == DebtType.lend) {
      contact.lend.add(
        Debt(
          date: DateTime.parse(date),
          amount: int.parse(amount.replaceAll(',00', '').replaceAll('.', '')),
          desc: desc,
        ),
      );

      contact.lend.sort((a, b) => a.date.compareTo(b.date));
    } else {
      contact.borrow.add(
        Debt(
          date: DateTime.parse(date),
          amount: int.parse(amount.replaceAll(',00', '').replaceAll('.', '')),
          desc: desc,
        ),
      );

      contact.borrow.sort((a, b) => a.date.compareTo(b.date));
    }

    update();
  }

  void editDebt(
    DebtType type,
    int index, {
    required String amount,
    required String desc,
    required String date,
  }) {
    if (type == DebtType.lend) {
      contact.lend[index].amount = int.parse(
        amount.replaceAll(',00', '').replaceAll('.', ''),
      );
      contact.lend[index].desc = desc;
      contact.lend[index].date = DateTime.parse(date);

      contact.lend.sort((a, b) => a.date.compareTo(b.date));
    } else {
      contact.borrow[index].amount = int.parse(
        amount.replaceAll(',00', '').replaceAll('.', ''),
      );
      contact.borrow[index].desc = desc;
      contact.borrow[index].date = DateTime.parse(date);

      contact.borrow.sort((a, b) => a.date.compareTo(b.date));
    }

    update();
  }

  void deleteDebt({required DebtType type, required int index}) {
    if (type == DebtType.lend) {
      contact.lend.removeAt(index);
      contact.lend.sort((a, b) => a.date.compareTo(b.date));
    } else {
      contact.borrow.removeAt(index);
      contact.borrow.sort((a, b) => a.date.compareTo(b.date));
    }

    update();
  }
}
