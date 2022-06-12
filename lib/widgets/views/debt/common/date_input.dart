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
        icon: Icon(Icons.calendar_today_rounded, size: 20),
        label: Text('Date'),
      ),
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }

        return null;
      },
      onTap: () async {
        DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
            builder: (BuildContext context, Widget? widget) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.black,
                      ),
                  textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                      foregroundColor: Theme.of(context)
                          .textButtonTheme
                          .style
                          ?.backgroundColor,
                    ),
                  ),
                ),
                child: widget as Widget,
              );
            });

        if (date != null) {
          controller.text = DateFormat('yyyy-MM-dd').format(date);
        }
      },
    );
  }
}
