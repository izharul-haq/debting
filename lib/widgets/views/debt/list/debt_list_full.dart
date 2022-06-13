import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/utils/currency.dart';
import 'package:debting/widgets/common/empty_list.dart';
import 'package:debting/widgets/common/section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DebtListFull extends StatelessWidget {
  final DebtType type;

  DebtListFull({Key? key, required this.type}) : super(key: key);

  final _controller = Get.find<DBController>();

  final _message = "You don't have any contact or debt yet";

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.listenable,
      builder: (context, box, _) {
        return _controller.contacts.isNotEmpty
            ? ListView.builder(
                itemCount: _controller.contacts.length,
                itemBuilder: (context, index) {
                  String _key = _controller.keyAt(index);
                  Contact _contact = _controller.getContact(_key);

                  return _contactDebt(_contact, type);
                },
              )
            : EmptyList(message: _message);
      },
    );
  }

  Widget _contactDebt(Contact contact, DebtType type) {
    return Section(
      title: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: (type == DebtType.lend ? contact.lend : contact.borrow)
            .asMap()
            .entries
            .map<Widget>(
              (e) => ListTile(
                leading: CircleAvatar(
                  child: Text(
                    DateFormat('dd\nMM').format(e.value.date),
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                title: Text(CurrencyUtils.format(e.value.amount)),
                subtitle: Text(e.value.desc),
              ),
            )
            .toList()
            .reversed
            .toList(),
      ),
    );
  }
}
