import 'package:debting/model/contact.dart';
import 'package:debting/util/currency.dart';
import 'package:debting/widget/common/spacing/column_spacing.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContactDebtCard extends StatelessWidget {
  final Contact contact;

  const ContactDebtCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = contact.sum();

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              total < 0
                  ? 'You owe ${contact.name}'
                  : '${contact.name} owes you',
              style: TextStyle(fontSize: 3.5.w),
              textAlign: TextAlign.center,
            ),
            ColumnSpacing(),
            Text(
              CurrencyUtils.format(total),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 6.w,
                color: total < 0 ? Colors.red.shade700 : Colors.green.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
