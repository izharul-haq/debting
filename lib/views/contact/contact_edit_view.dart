import 'package:debting/widgets/views/contact/edit/contact_edit_form.dart';
import 'package:flutter/material.dart';

class ContactEditView extends StatelessWidget {
  const ContactEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Contact')),
      body: ContactEditForm(),
    );
  }
}
