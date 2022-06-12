import 'package:debting/widgets/common/spacing.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget title;
  final Widget content;

  const Section({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        title,
        Spacing(),
        content,
      ],
    );
  }
}
