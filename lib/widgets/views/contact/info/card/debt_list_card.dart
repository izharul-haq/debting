import 'dart:math';

import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/widgets/common/empty_list.dart';
import 'package:debting/widgets/views/contact/info/debt_list.dart';
import 'package:debting/widgets/views/contact/info/debt_list_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DebtListCard extends StatelessWidget {
  final DebtType type;

  DebtListCard({Key? key, required this.type}) : super(key: key);

  final _contactController = Get.find<ContactController>();

  final _message = "There's no debt recorded";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.5.w),
        child: GetBuilder<ContactController>(builder: (controller) {
          List<Debt> debts = type == DebtType.lend
              ? _contactController.contact.lend
              : _contactController.contact.borrow;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _title(),
              Divider(thickness: 1),
              debts.isNotEmpty
                  ? DebtList(
                      type: type,
                      debts: debts,
                      length: min(debts.length, 5),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: EmptyList(message: _message),
                    ),
            ],
          );
        }),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          type == DebtType.lend ? 'Lending' : 'Borrowing',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 4.w),
        ),
        IconButton(
          onPressed: () => Get.bottomSheet(DebtListBottomSheet(type: type)),
          icon: Icon(Icons.more_horiz_rounded),
        ),
      ],
    );
  }
}
