import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatelessWidget {
  final TextEditingController controller;
  const DateInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        icon: Icon(Icons.calendar_today_rounded, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        label: Text('Date'),
      ),
      readOnly: true,
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please select a date' : null,
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );

        if (date != null) {
          controller.text = DateFormat('yyyy-MM-dd').format(date);
        }
      },
    );
  }
}
