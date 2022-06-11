import 'package:flutter/material.dart';

class DangerButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const DangerButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Text(text),
    );
  }
}
