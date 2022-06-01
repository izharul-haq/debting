import 'package:debting/widget/screen/contact/edit_contact.dart';
import 'package:flutter/material.dart';

class EditContactScreen extends StatelessWidget {
  final String uuid;
  const EditContactScreen({Key? key, required this.uuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Contact')),
      body: EditContact(uuid: uuid),
    );
  }
}
