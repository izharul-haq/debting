import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/widgets/common/buttons/danger_button.dart';
import 'package:debting/widgets/common/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClearDebtButton extends StatelessWidget {
  ClearDebtButton({Key? key}) : super(key: key);

  final _contactController = Get.find<ContactController>();
  final _dbController = Get.find<DBController>();

  final String _message =
      'This will clear all debt you/this person owe(s). Are you sure?';

  @override
  Widget build(BuildContext context) {
    return DangerButton(
      child: Text('Clear All Debt'),
      onPressed: () => Get.dialog(
        WarningDialog(
          message: _message,
          onAccept: () {
            Contact updatedContact = _contactController.updateContact(
              lend: List<Debt>.empty(growable: true),
              borrow: List<Debt>.empty(growable: true),
            );

            _dbController.editContact(_contactController.key, updatedContact);
          },
        ),
      ),
    );
  }
}
