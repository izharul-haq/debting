import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DebtList extends StatelessWidget {
  final DebtType type;
  final List<Debt> debts;
  final int? length;

  DebtList({
    Key? key,
    required this.type,
    required this.debts,
    this.length,
  }) : super(key: key);

  final _contactController = Get.find<ContactController>();
  final _dbController = Get.find<DBController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: debts
          .sublist(0, length)
          .asMap()
          .entries
          .map<Widget>(
            (e) => ListTile(
              leading: CircleAvatar(
                child: Text(
                  DateFormat('dd\nMM').format(e.value.date),
                  style: TextStyle(fontSize: 13),
                ),
              ),
              title: Text(CurrencyUtils.format(e.value.amount)),
              trailing: IconButton(
                onPressed: () {
                  debts.removeAt(e.key);
                  Contact updatedContact = type == DebtType.lend
                      ? _contactController.updateContact(lend: debts)
                      : _contactController.updateContact(borrow: debts);

                  _dbController.editContact(
                    _contactController.key,
                    updatedContact,
                  );
                },
                icon: Icon(Icons.delete_rounded),
              ),
            ),
          )
          .toList(),
    );
  }
}
