import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/utils/currency.dart';
import 'package:debting/widgets/common/section.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TotalSection extends StatelessWidget {
  TotalSection({Key? key}) : super(key: key);

  final _controller = Get.find<DBController>();

  @override
  Widget build(BuildContext context) {
    return Section(title: _title(), content: _content());
  }

  Widget _title() {
    return SizedBox();
  }

  Widget _content() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: ValueListenableBuilder(
          valueListenable: _controller.listenable,
          builder: (context, box, _) {
            var _contacts = _controller.contacts;

            int total = _contacts.fold(
              0,
              (prev, e) =>
                  prev +
                  (e as Contact).sum(includeLend: true, includeBorrow: true),
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'In total, ${total < 0 ? 'you owe everyone' : 'everyone owes you'}'),
                Spacing(),
                Text(
                  CurrencyUtils.format(total.abs()),
                  style: TextStyle(
                    fontSize: 2.5.h,
                    fontWeight: FontWeight.w500,
                    color:
                        total < 0 ? Colors.red.shade700 : Colors.green.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
