import 'package:debting/controllers/calculator_controller.dart';
import 'package:debting/widgets/common/buttons/transparent_button.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CalculatorDialog extends StatelessWidget {
  final int? initial;

  CalculatorDialog({Key? key, this.initial}) : super(key: key);

  final _calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    _calculatorController.setInitial(initial ?? 0);

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 60.w,
        height: 44.5.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _expressionView(),
            Spacing(),
            _calculatorPad(),
          ],
        ),
      ),
      actions: [
        TransparentButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _calculatorController.parse();
            Get.back(result: _calculatorController.result);
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }

  Widget _expressionView() {
    return Container(
      height: 8.h,
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Rp',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.h),
          ),
          SizedBox(width: 1.5.w),
          GetBuilder<CalculatorController>(builder: (controller) {
            return Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  controller.expression,
                  style: TextStyle(fontSize: 3.h, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _calculatorPad() {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: _calculatorController.buttons
          .map(
            (button) => IconButton(
              onPressed: () => _calculatorController.updateExpression(button),
              icon: Text(
                button,
                style: TextStyle(fontSize: 3.h, fontWeight: FontWeight.w500),
              ),
            ),
          )
          .toList(),
    );
  }
}
