import 'package:debting/util/text.dart';
import 'package:flutter/material.dart';

class SumDebt extends StatelessWidget {
  final int total;
  final String name;
  const SumDebt({Key? key, required this.name, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iOwe = total < 0;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(iOwe ? 'You owe $name' : '$name owe you'),
            SizedBox(height: 10),
            Text(
              currencyFormatter(total.abs()),
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                color: iOwe ? Colors.red : Colors.green.shade700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
