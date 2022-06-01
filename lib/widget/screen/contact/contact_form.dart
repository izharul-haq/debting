import 'package:debting/model/contact.dart';
import 'package:debting/widget/screen/contact/input/name_input.dart';
import 'package:debting/widget/screen/contact/input/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _phone = TextEditingController();

  late Box debtBox;

  @override
  void initState() {
    super.initState();
    debtBox = Hive.box('debts');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    Uuid().v4(),
                    Contact(
                      name: _name.text,
                      lend: [],
                      borrow: [],
                      phone: _phone.text == '' ? null : '+62${_phone.text}',
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Save', style: TextStyle(fontSize: 16)),
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
    _name.dispose();
    super.dispose();
  }
}
