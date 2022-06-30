import 'package:debting/controllers/calculator_controller.dart';
import 'package:debting/utils/currency.dart';
import 'package:debting/widgets/views/debt/common/calculator_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmountInput extends StatelessWidget {
  final TextEditingController controller;
  final int? initial;

  AmountInput({
    Key? key,
    required this.controller,
    this.initial,
  }) : super(key: key);

  final _calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(Icons.monetization_on_rounded, size: 20),
        label: Text('Amount'),
        prefix: Text('Rp'),
      ),
      readOnly: true,
      onTap: () async {
        int amount = await Get.dialog(CalculatorDialog(initial: initial)) ??
            (_calculatorController.result != 0
                ? _calculatorController.result
                : (initial ?? 0));
        controller.text = CurrencyUtils.format(amount).substring(2);
      },
    );
  }
}
