import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/routes/route_names.dart';
import 'package:debting/utils/currency.dart';
import 'package:debting/widgets/common/warning_dialog.dart';
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

  final String _message = 'This will delete the selected debt. Are you sure?';

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
              onTap: () => Get.toNamed(
                RouteNames.debtEdit,
                arguments: {'index': e.key, 'type': type},
              ),
              leading: CircleAvatar(
                child: Text(
                  DateFormat('dd\nMM').format(e.value.date),
                  style: TextStyle(fontSize: 13),
                ),
              ),
              title: Text(CurrencyUtils.format(e.value.amount)),
              subtitle: Text(e.value.desc),
              trailing: IconButton(
                onPressed: () => Get.dialog(
                  WarningDialog(
                    message: _message,
                    onAccept: () {
                      debts.removeAt(e.key);
                      type == DebtType.lend
                          ? _contactController.updateContact(lend: debts)
                          : _contactController.updateContact(borrow: debts);

                      _dbController.editContact(
                        _contactController.key,
                        _contactController.contact,
                      );
                    },
                  ),
                ),
                icon: Icon(Icons.delete_rounded),
              ),
            ),
          )
          .toList()
          .reversed
          .toList(),
    );
  }
}
