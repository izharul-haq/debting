import 'package:debting/controller/contact_controller.dart';
import 'package:debting/model/contact.dart';
import 'package:debting/widget/common/danger_button.dart';
import 'package:debting/widget/common/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactClearDebtButton extends StatelessWidget {
  final String index;
  final Contact contact;

  ContactClearDebtButton({
    Key? key,
    required this.index,
    required this.contact,
  }) : super(key: key);

  final _controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return DangerButton(
      onPressed: () async {
        await Get.dialog(
          WarningDialog(
            message:
                'This will clear all debts you/this person owe(s). Are you sure?',
            onAccept: () => _controller.clearDebt(index, contact),
          ),
        );
      },
      text: 'Clear All Debt',
    );
  }
}
