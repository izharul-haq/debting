import 'package:debting/models/contact.dart';
import 'package:debting/models/debt.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class DBController extends GetxController {
  static final Box _box = Hive.box<Contact>('debts');

  ValueListenable<Box<dynamic>> get listenable => _box.listenable();
  Iterable<dynamic> get contacts => _box.values;

  // CRUD
  String keyAt(int index) {
    return _box.keyAt(index) as String;
  }

  Contact getContact(String key) {
    return _box.get(key) as Contact;
  }

  void addContact({required String name, required String phone}) async {
    await _box.put(
      Uuid().v4(),
      Contact(
        name: name,
        phone: phone != '' ? phone : null,
        lend: List<Debt>.empty(growable: true),
        borrow: List<Debt>.empty(growable: true),
      ),
    );
  }

  void editContact(String key, Contact contact) async {
    await _box.put(key, contact);
  }

  void deleteContact(String key) async {
    await _box.delete(key);
  }

  void clearDB() async {
    await _box.clear();
  }
}
