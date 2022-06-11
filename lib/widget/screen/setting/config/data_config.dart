import 'package:debting/controller/contact_controller.dart';
import 'package:debting/widget/common/danger_button.dart';
import 'package:debting/widget/common/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataConfig extends StatelessWidget {
  DataConfig({Key? key}) : super(key: key);

  final _controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return DangerButton(
      onPressed: () async {
        await Get.dialog(
          WarningDialog(
            message: 'This will clear your data. Are you sure?',
            onAccept: _controller.clearContacts,
          ),
        );
      },
      text: 'Clear Data',
    );
  }
}
