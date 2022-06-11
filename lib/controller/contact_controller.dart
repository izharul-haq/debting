import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class ContactController extends GetxController {
  final Box _box = Hive.box<Contact>('debts');

  ValueListenable get listenable => _box.listenable();

  dynamic get contacts => _box.values;

  String getKey(int index) {
    return _box.keyAt(index) as String;
  }

  // CRUD Contact
  Contact getContact(String key) {
    return _box.get(key) as Contact;
  }

  void addContact({required String name, required String phone}) async {
    await _box.put(
      Uuid().v4(),
      Contact(
        name: name,
        phone: phone != '' ? phone : null,
        lend: List<Debt>.empty(),
        borrow: List<Debt>.empty(),
      ),
    );
  }

  void editContact(
    String key, {
    required String name,
    required String phone,
    required List<Debt> lend,
    required List<Debt> borrow,
  }) async {
    await _box.put(
      key,
      Contact(
        name: name,
        phone: phone != '' ? phone : null,
        lend: lend,
        borrow: borrow,
      ),
    );
  }

  void deleteContact(String key) async {
    await _box.delete(key);
  }

  void clearContacts() async {
    await _box.clear();
  }

  // CRUD Debt
  void deleteDebt({
    required String key,
    required Contact contact,
    required DebtType type,
    required int index,
  }) {
    if (type == DebtType.lend) contact.lend.removeAt(index);
    if (type == DebtType.borrow) contact.borrow.removeAt(index);

    editContact(
      key,
      name: contact.name,
      phone: contact.phone ?? '',
      lend: contact.lend,
      borrow: contact.borrow,
    );
  }

  void clearDebt(String key, Contact contact) async {
    await _box.put(
      key,
      Contact(
        name: contact.name,
        phone: contact.phone,
        lend: List<Debt>.empty(),
        borrow: List<Debt>.empty(),
      ),
    );
  }
}
