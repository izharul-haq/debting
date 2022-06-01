import 'package:debting/model/contact.dart';
import 'package:debting/widget/screen/contact/input/name_input.dart';
import 'package:debting/widget/screen/contact/input/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EditContact extends StatefulWidget {
  final String uuid;
  // final Contact contact;
  const EditContact({
    Key? key,
    required this.uuid,
    // required this.contact,
  }) : super(key: key);

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _phone = TextEditingController();

  late Box debtBox;
  late String uuid;
  late Contact contact;

  @override
  void initState() {
    super.initState();

    debtBox = Hive.box('debts');
    uuid = widget.uuid;
    contact = debtBox.get(uuid);

    _name.text = contact.name;
    contact.phone != null ? _phone.text = contact.phone as String : null;
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
            NameInput(controller: _name),
            SizedBox(height: 10),
            PhoneInput(controller: _phone),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  debtBox.put(
                    uuid,
                    Contact(
                      name: _name.text,
                      lend: contact.lend,
                      borrow: contact.borrow,
                      phone: _phone.text == '' ? null : '+62${_phone.text}',
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Edit', style: TextStyle(fontSize: 16)),
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
}
