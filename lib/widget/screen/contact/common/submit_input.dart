import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onPressed;
  final String text;

  const SubmitInput({
    Key? key,
    required this.formKey,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          onPressed();
          Get.back();
        }
      },
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }
}
