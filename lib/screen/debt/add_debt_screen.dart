import 'package:debting/widget/screen/debt/debt_form.dart';
import 'package:flutter/material.dart';

class AddDebtScreen extends StatelessWidget {
  final String uuid;

  const AddDebtScreen({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DebtForm(
        uuid: uuid,
      ),
    );
  }
}
