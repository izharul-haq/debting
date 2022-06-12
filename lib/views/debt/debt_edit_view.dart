import 'package:debting/models/debt.dart';
import 'package:debting/widgets/views/debt/edit/debt_edit_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebtEditView extends StatefulWidget {
  const DebtEditView({Key? key}) : super(key: key);

  @override
  State<DebtEditView> createState() => _DebtEditViewState();
}

class _DebtEditViewState extends State<DebtEditView> {
  final int _debtIndex = Get.arguments['index'];
  final DebtType _debtType = Get.arguments['type'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Debt')),
      body: DebtEditForm(index: _debtIndex, type: _debtType),
    );
  }
}
