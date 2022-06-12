import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        FilteringTextInputFormatter.deny(RegExp('^(62)|^(0)', multiLine: true))
      ],
      decoration: InputDecoration(
        helperText: 'Remove country code and trunk prefix (ex. +62 or 0)',
        prefixText: '+62',
        icon: Icon(Icons.phone_rounded, size: 20),
        label: Text('Phone'),
      ),
    );
  }
}
