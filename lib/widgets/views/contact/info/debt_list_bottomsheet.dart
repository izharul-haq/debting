import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/widgets/common/empty_list.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:debting/widgets/views/contact/info/debt_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DebtListBottomSheet extends StatelessWidget {
  final DebtType type;

  const DebtListBottomSheet({Key? key, required this.type}) : super(key: key);

  final _message = "There's no debt recorded";

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        builder: (context, scrollController) {
          return GetBuilder<ContactController>(
            builder: (controller) {
              List<Debt> debts = type == DebtType.lend
                  ? controller.contact.lend
                  : controller.contact.borrow;

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.w),
                    topRight: Radius.circular(2.w),
                  ),
                ),
                child: debts.isNotEmpty
                    ? _debtList(scrollController, debts)
                    : _emptyDebt(),
              );
            },
          );
        });
  }

  Widget _debtList(ScrollController scrollController, List<Debt> debts) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DebtList(type: type, debts: debts),
          Spacing(),
          _closeButton(),
        ],
      ),
    );
  }

  Widget _emptyDebt() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmptyList(message: _message),
          Spacing(),
          _closeButton(),
        ],
      ),
    );
  }

  Widget _closeButton() {
    return TextButton(onPressed: () => Get.back(), child: Text('Close'));
  }
}
