import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/routes/route_names.dart';
import 'package:debting/utils/currency.dart';
import 'package:debting/widgets/common/section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TotalDebtSection extends StatelessWidget {
  final DebtType type;

  TotalDebtSection({Key? key, required this.type}) : super(key: key);

  final _controller = Get.find<DBController>();

  @override
  Widget build(BuildContext context) {
    return Section(title: _title(), content: _content());
  }

  Widget _title() {
    return Text(
      type == DebtType.lend ? 'Lend' : 'Borrow',
      style: TextStyle(fontSize: 2.h, fontWeight: FontWeight.w500),
    );
  }

  Widget _content() {
    return Card(
      child: ValueListenableBuilder(
        valueListenable: _controller.listenable,
        builder: (context, box, _) {
          var _contacts = _controller.contacts;

          int debtTotal = _contacts.fold(
            0,
            (prev, e) =>
                prev +
                (e as Contact).sum(
                  includeLend: type == DebtType.lend,
                  includeBorrow: type == DebtType.borrow,
                ),
          );

          return ListTile(
            onTap: () => Get.toNamed(RouteNames.debtList, arguments: type),
            leading: Icon(
              type == DebtType.lend
                  ? Icons.arrow_upward_rounded
                  : Icons.arrow_downward_rounded,
            ),
            title: Text(
              CurrencyUtils.format(debtTotal.abs()),
              style: TextStyle(
                fontSize: 2.5.h,
                fontWeight: FontWeight.w500,
                color: type == DebtType.lend
                    ? Colors.green.shade700
                    : Colors.red.shade700,
              ),
              textAlign: TextAlign.right,
            ),
          );
        },
      ),
    );
  }
}
