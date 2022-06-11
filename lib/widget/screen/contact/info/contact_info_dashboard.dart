import 'package:debting/constant/screen_padding.dart';
import 'package:debting/controller/contact_controller.dart';
import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:debting/widget/common/spacing/column_spacing.dart';
import 'package:debting/widget/screen/contact/info/card/contact_debt_list.dart';
import 'package:debting/widget/screen/contact/info/contact_clear_debt_button.dart';
import 'package:debting/widget/screen/contact/info/card/contact_debt_card.dart';
import 'package:debting/widget/screen/contact/info/card/contact_info_card.dart';
import 'package:debting/widget/screen/contact/info/card/contact_phone_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactInfoDashboard extends StatelessWidget {
  final String index;

  ContactInfoDashboard({Key? key, required this.index}) : super(key: key);

  final _controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: screenPadding,
      child: ValueListenableBuilder(
        valueListenable: _controller.listenable,
        builder: (context, box, widget) {
          Contact contact = _controller.getContact(index);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ContactInfoCard(contact: contact),
              ColumnSpacing(),
              ContactPhoneCard(contact: contact),
              ColumnSpacing(),
              ContactDebtCard(contact: contact),
              ColumnSpacing(),
              ColumnSpacing(),
              Center(child: Text('Debt List')),
              ColumnSpacing(),
              ColumnSpacing(),
              ContactDebtList(
                type: DebtType.lend,
                index: index,
                contact: contact,
              ),
              ColumnSpacing(),
              ContactDebtList(
                type: DebtType.borrow,
                index: index,
                contact: contact,
              ),
              ContactClearDebtButton(index: index, contact: contact)
            ],
          );
        },
      ),
    );
  }
}
