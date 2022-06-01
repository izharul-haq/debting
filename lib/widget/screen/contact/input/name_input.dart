import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final TextEditingController controller;
  const NameInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(Icons.person_rounded, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        label: Text('Name'),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter a name';
        }

        return null;
      },
    );
  }
}
