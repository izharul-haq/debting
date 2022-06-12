import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/utils/currency.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DebtTotalCard extends StatelessWidget {
  const DebtTotalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: GetBuilder<ContactController>(
          builder: (controller) {
            int total = controller.contact.sum(
              includeLend: true,
              includeBorrow: true,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  total < 0
                      ? 'You owe ${controller.contact.name}'
                      : '${controller.contact.name} owes you',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 3.5.w),
                ),
                Spacing(),
                Text(
                  CurrencyUtils.format(total),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 6.w,
                    color:
                        total < 0 ? Colors.red.shade700 : Colors.green.shade700,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
