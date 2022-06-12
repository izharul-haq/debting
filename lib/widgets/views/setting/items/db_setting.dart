import 'package:debting/controllers/db_controller.dart';
import 'package:debting/widgets/common/buttons/danger_button.dart';
import 'package:debting/widgets/common/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DbSetting extends StatelessWidget {
  DbSetting({Key? key}) : super(key: key);

  final _controller = Get.find<DBController>();

  final String _message = 'This will clear your data. Are you sure?';

  @override
  Widget build(BuildContext context) {
    return DangerButton(
      child: Text('Clear Data'),
      onPressed: () => Get.dialog(
        WarningDialog(
          message: _message,
          onAccept: _controller.clearDB,
        ),
      ),
    );
  }
}
