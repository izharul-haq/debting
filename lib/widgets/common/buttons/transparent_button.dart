import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const TransparentButton({
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
        foregroundColor:
            Theme.of(context).textButtonTheme.style?.backgroundColor,
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
    );
  }
}
