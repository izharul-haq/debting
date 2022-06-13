import 'package:flutter/material.dart';

class DangerButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const DangerButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );
  }
}
