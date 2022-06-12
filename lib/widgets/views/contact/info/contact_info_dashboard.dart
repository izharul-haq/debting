import 'package:debting/constants/screen_padding.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:debting/widgets/views/contact/info/card/debt_list_card.dart';
import 'package:debting/widgets/views/contact/info/card/debt_total_card.dart';
import 'package:debting/widgets/views/contact/info/card/phone_card.dart';
import 'package:debting/widgets/views/contact/info/card/profile_card.dart';
import 'package:debting/widgets/views/contact/info/clear_debt_button.dart';
import 'package:flutter/material.dart';

class ContactInfoDashboard extends StatelessWidget {
  const ContactInfoDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileCard(),
          Spacing(),
          PhoneCard(),
          Spacing(),
          DebtTotalCard(),
          Spacing(),
          Spacing(),
          Center(child: Text('Debt List')),
          Spacing(),
          Spacing(),
          DebtListCard(type: DebtType.lend),
          Spacing(),
          DebtListCard(type: DebtType.borrow),
          Spacing(),
          ClearDebtButton(),
        ],
      ),
    );
  }
}
