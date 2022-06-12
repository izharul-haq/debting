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

  Contact updateContact({
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

    return contact;
  }
}
