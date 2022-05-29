import 'package:debting/model/debt.dart';
import 'package:debting/model/debt_type.dart';
import 'package:debting/widget/screen/debt/debt_edit.dart';
import 'package:flutter/material.dart';

class EditDebtScreen extends StatelessWidget {
  final String uuid;
  final DebtType type;
  final Debt debt;
  const EditDebtScreen({
    Key? key,
    required this.uuid,
    required this.type,
    required this.debt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Debt')),
      body: DebtEdit(uuid: uuid, debt: debt, type: type),
    );
  }
}
