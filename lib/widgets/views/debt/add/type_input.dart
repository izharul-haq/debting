import 'package:debting/models/debt.dart';
import 'package:flutter/material.dart';

class TypeInput extends StatelessWidget {
  final DebtType? value;
  final void Function(DebtType? type) onChanged;

  const TypeInput({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: [
        DropdownMenuItem(child: Text('Lending'), value: DebtType.lend),
        DropdownMenuItem(child: Text('Borrowing'), value: DebtType.borrow),
      ],
      decoration: InputDecoration(
        icon: Icon(Icons.savings_rounded, size: 20),
        label: Text('Type'),
      ),
      value: value,
      onChanged: onChanged,
      validator: (value) {
        if (value == null) return 'Please select debt type';

        return null;
      },
    );
  }
}
