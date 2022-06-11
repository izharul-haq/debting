import 'package:debting/widget/screen/contact/add/contact_add_form.dart';
import 'package:flutter/material.dart';

class ContactAddScreen extends StatelessWidget {
  const ContactAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact')),
      body: ContactAddForm(),
    );
  }
}
