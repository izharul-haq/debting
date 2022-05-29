import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:debting/model/debt_type.dart';
import 'package:debting/widget/screen/debt/input/amount_input.dart';
import 'package:debting/widget/screen/debt/input/date_input.dart';
import 'package:debting/widget/screen/debt/input/desc_input.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DebtEdit extends StatefulWidget {
  final String uuid;
  final Debt debt;
  final DebtType type;
  const DebtEdit({
    Key? key,
    required this.uuid,
    required this.debt,
    required this.type,
  }) : super(key: key);

  @override
  State<DebtEdit> createState() => _DebtEditState();
}

class _DebtEditState extends State<DebtEdit> {
  final _formKey = GlobalKey<FormState>();

  final _amount = TextEditingController();
  final _desc = TextEditingController();
  final _date = TextEditingController();

  late Box debtBox;
  late Debt debt;
  late String uuid;
  late DebtType type;

  @override
  void initState() {
    super.initState();

    debtBox = Hive.box('debts');
    debt = widget.debt.deepCopy();
    uuid = widget.uuid;
    type = widget.type;

    _amount.text = widget.debt.amount.toString();
    _desc.text = widget.debt.desc;
    _date.text = DateFormat('yyyy-MM-dd').format(widget.debt.date);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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

                  if (type == DebtType.lend) {
                    contact.lend.removeWhere((d) => debt.equals(d));
                    contact.lend.add(Debt(
                      date: DateTime.parse(_date.text),
                      amount: int.parse(_amount.text),
                      desc: _desc.text,
                    ));
                    contact.lend.sort((a, b) => a.date.compareTo(b.date));
                  } else {
                    contact.borrow.removeWhere((d) => debt.equals(d));
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
              child: Text('Edit Debt', style: TextStyle(fontSize: 16)),
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

  @override
  void dispose() {
    _amount.dispose();
    _desc.dispose();
    _date.dispose();
    super.dispose();
  }
}
