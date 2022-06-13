import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final TextEditingController controller;

  const NameInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(Icons.person_rounded, size: 20),
        label: Text('Name'),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }

        return null;
      },
    );
  }
}
