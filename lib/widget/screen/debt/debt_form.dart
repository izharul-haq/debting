import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DebtForm extends StatefulWidget {
  final String uuid;
  const DebtForm({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  @override
  State<DebtForm> createState() => _DebtFormState();
}

class _DebtFormState extends State<DebtForm> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _desc = TextEditingController();
  final _date = TextEditingController();

  late Box debtBox;
  late String uuid;

  String? _type;
  bool paid = false;

  @override
  void initState() {
    super.initState();
    debtBox = Hive.box('debts');
    uuid = widget.uuid;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _typeForm(),
            SizedBox(height: 10),
            _amountForm(_amount),
            SizedBox(height: 10),
            _descForm(_desc),
            SizedBox(height: 10),
            _dateForm(_date),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var contact = debtBox.get(uuid) as Contact;

                  if (_type == 'lend') {
                    contact.lend.add(Debt(
                      date: DateTime.parse(_date.text),
                      amount: int.parse(_amount.text),
                      desc: _desc.text,
                    ));
                  } else if (_type == 'borrow') {
                    contact.borrow.add(Debt(
                      date: DateTime.parse(_date.text),
                      amount: int.parse(_amount.text),
                      desc: _desc.text,
                    ));
                  }

                  debtBox.put(
                    uuid,
                    Contact(
                      name: contact.name,
                      lend: contact.lend,
                      borrow: contact.borrow,
                    ),
                  );

                  Navigator.pop(context);
                }
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.all(Colors.blue.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _amountForm(TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-91]'))],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        icon: Icon(
          Icons.monetization_on_rounded,
          size: 20,
        ),
        label: Text('Amount'),
        prefix: Text('Rp'),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please enter debt amount' : null,
    );
  }

  Widget _descForm(TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        icon: Icon(
          Icons.description_rounded,
          size: 20,
        ),
        label: Text('Description'),
      ),
    );
  }

  Widget _typeForm() {
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem(
          child: Text('Lending'),
          value: 'lend',
        ),
        DropdownMenuItem(
          child: Text('Borrowing'),
          value: 'borrow',
        ),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        icon: Icon(Icons.savings_rounded),
        label: Text('Type'),
      ),
      value: _type,
      onChanged: (String? value) {
        setState(() => _type = value);
      },
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please select debt type' : null,
    );
  }

  Widget _dateForm(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        icon: Icon(
          Icons.calendar_today_rounded,
          size: 20,
        ),
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
          String dateFormatted = DateFormat('yyyy-MM-dd').format(date);

          setState(() {
            controller.text = dateFormatted;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _amount.dispose();
    _desc.dispose();
    _date.dispose();
    super.dispose();
  }
}
