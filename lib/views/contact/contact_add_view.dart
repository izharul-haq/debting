import 'package:debting/widgets/views/contact/add/contact_add_form.dart';
import 'package:flutter/material.dart';

class ContactAddView extends StatelessWidget {
  const ContactAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact')),
      body: ContactAddForm(),
    );
  }
}
