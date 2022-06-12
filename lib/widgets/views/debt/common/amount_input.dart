import 'package:debting/utils/currency.dart';
import 'package:debting/widgets/views/debt/common/calculator_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmountInput extends StatelessWidget {
  final TextEditingController controller;

  const AmountInput({Key? key, required this.controller}) : super(key: key);

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
        int amount = await Get.dialog(CalculatorDialog()) ?? 0;
        controller.text = CurrencyUtils.format(amount).substring(2);
      },
    );
  }
}
