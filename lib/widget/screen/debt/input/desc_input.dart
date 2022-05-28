import 'package:flutter/material.dart';

class DescInput extends StatelessWidget {
  final TextEditingController controller;
  const DescInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        icon: Icon(Icons.description_rounded, size: 20),
        label: Text('Description'),
      ),
    );
  }
}
