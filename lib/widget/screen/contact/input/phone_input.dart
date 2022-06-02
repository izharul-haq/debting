import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController controller;
  const PhoneInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
      decoration: InputDecoration(
        helperText: 'Remove country code and trunk prefix (ex. +62 or 0)',
        prefixText: '+62',
        icon: Icon(Icons.phone_rounded, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        label: Text('Phone'),
      ),
      validator: (val) {
        if (val!.startsWith('+62') || val.startsWith('0')) {
          return 'Please remove country code and trunk prefix';
        }

        return null;
      },
    );
  }
}
