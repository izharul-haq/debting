import 'package:debting/widget/screen/contact/contact_form.dart';
import 'package:flutter/material.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact')),
      body: ContactForm(),
    );
  }
}
