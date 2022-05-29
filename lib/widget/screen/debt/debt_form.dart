import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:debting/model/debt_type.dart';
import 'package:debting/widget/screen/debt/input/amount_input.dart';
import 'package:debting/widget/screen/debt/input/date_input.dart';
import 'package:debting/widget/screen/debt/input/desc_input.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DebtForm extends StatefulWidget {
  final String uuid;
  const DebtForm({Key? key, required this.uuid}) : super(key: key);

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

  DebtType? _type;

  @override
  void initState() {
    super.initState();
    debtBox = Hive.box('debts');
    uuid = widget.uuid;
    _date.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _typeForm(),
            SizedBox(height: 10),
            AmountInput(controller: _amount),
            SizedBox(height: 10),
            DescInput(controller: _desc),
            SizedBox(height: 10),
            DateInput(controller: _date),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var contact = debtBox.get(uuid) as Contact;

                  if (_type == DebtType.lend) {
                    contact.lend.add(Debt(
                      date: DateTime.parse(_date.text),
                      amount: int.parse(_amount.text),
                      desc: _desc.text,
                    ));

                    contact.lend.sort((a, b) => a.date.compareTo(b.date));
                  } else if (_type == DebtType.borrow) {
                    contact.borrow.add(Debt(
                      date: DateTime.parse(_date.text),
                      amount: int.parse(_amount.text),
                      desc: _desc.text,
                    ));

                    contact.borrow.sort((a, b) => a.date.compareTo(b.date));
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
              child: Text('Add Debt', style: TextStyle(fontSize: 16)),
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

  Widget _typeForm() {
    return DropdownButtonFormField<DebtType>(
      items: [
        DropdownMenuItem(child: Text('Lending'), value: DebtType.lend),
        DropdownMenuItem(child: Text('Borrowing'), value: DebtType.borrow),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        isDense: true,
        icon: Icon(Icons.savings_rounded, size: 20),
        label: Text('Type'),
      ),
      value: _type,
      onChanged: (DebtType? value) {
        setState(() => _type = value);
      },
      validator: (value) => (value == null) ? 'Please select debt type' : null,
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
