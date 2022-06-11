import 'package:debting/widget/common/danger_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarningDialog extends StatelessWidget {
  final String message;
  final void Function() onAccept;

  const WarningDialog({
    Key? key,
    required this.message,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Get.back(), child: Text('No')),
        DangerButton(
          onPressed: () {
            onAccept();
            Get.back();
          },
          text: 'Yes',
        ),
      ],
    );
  }
}
