import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyList extends StatelessWidget {
  final String message;

  const EmptyList({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message,
      style: TextStyle(fontSize: 4.w),
    ));
  }
}
