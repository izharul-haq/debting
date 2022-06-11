import 'dart:math';

import 'package:debting/controller/contact_controller.dart';
import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:debting/util/currency.dart';
import 'package:debting/widget/common/empty_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ContactDebtList extends StatelessWidget {
  final DebtType type;
  final Contact contact;
  final String index;

  ContactDebtList({
    Key? key,
    required this.type,
    required this.index,
    required this.contact,
  }) : super(key: key);

  final _controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    List<Debt> debts = [];
    if (type == DebtType.lend && contact.lend.isNotEmpty) {
      debts = contact.lend;
    }
    if (type == DebtType.borrow && contact.borrow.isNotEmpty) {
      debts = contact.borrow;
    }

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _cardTitle(),
            Divider(thickness: 1),
            debts.isNotEmpty
                ? _debtList(debts)
                : EmptyList(message: 'There\'s no debt recorded'),
          ],
        ),
      ),
    );
  }

  Widget _cardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          type == DebtType.lend ? 'Lending' : 'Borrowing',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 4.w),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz_rounded),
        ),
      ],
    );
  }

  Widget _debtList(List<Debt> debts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: debts
          .sublist(0, min(debts.length, 5))
          .asMap()
          .entries
          .map(
            (e) => ListTile(
              leading: CircleAvatar(
                child: Text(
                  DateFormat('dd\nMM').format(e.value.date),
                  style: TextStyle(fontSize: 13),
                ),
              ),
              title: Text(CurrencyUtils.format(e.value.amount)),
              subtitle: Text(e.value.desc),
              trailing: IconButton(
                onPressed: () => _controller.deleteDebt(
                  key: index,
                  contact: contact,
                  type: type,
                  index: e.key,
                ),
                icon: Icon(Icons.delete_rounded),
              ),
            ),
          )
          .toList(),
    );
  }
}
