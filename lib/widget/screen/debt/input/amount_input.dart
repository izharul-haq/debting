import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountInput extends StatelessWidget {
  final TextEditingController controller;
  const AmountInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        icon: Icon(Icons.monetization_on_rounded, size: 20),
        label: Text('Amount'),
        prefix: Text('Rp'),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please enter debt amount' : null,
    );
  }
}
