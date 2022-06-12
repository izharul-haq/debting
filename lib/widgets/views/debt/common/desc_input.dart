import 'package:flutter/material.dart';

class DescInput extends StatelessWidget {
  final TextEditingController controller;

  const DescInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(Icons.description_rounded, size: 20),
        label: Text('Description'),
      ),
    );
  }
}
