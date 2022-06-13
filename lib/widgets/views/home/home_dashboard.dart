import 'package:debting/constants/screen_padding.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:debting/widgets/views/home/section/contact_preview_section.dart';
import 'package:debting/widgets/views/home/section/total_debt_section.dart';
import 'package:debting/widgets/views/home/section/total_section.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContactPreviewSection(),
          Spacing(),
          Spacing(),
          Center(child: Text('Summary')),
          Spacing(),
          Spacing(),
          TotalDebtSection(type: DebtType.lend),
          Spacing(),
          TotalDebtSection(type: DebtType.borrow),
          Spacing(),
          TotalSection(),
        ],
      ),
    );
  }
}
