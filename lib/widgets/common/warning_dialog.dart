import 'package:debting/widgets/common/buttons/danger_button.dart';
import 'package:debting/widgets/common/buttons/transparent_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 2.1.h),
      ),
      actions: [
        TransparentButton(onPressed: () => Get.back(), child: Text('No')),
        DangerButton(
          onPressed: () {
            onAccept();
            Get.back();
          },
          child: Text('Yes'),
        ),
      ],
    );
  }
}
