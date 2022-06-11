import 'package:debting/widget/screen/contact/edit/contact_edit_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactEditScreen extends StatefulWidget {
  const ContactEditScreen({Key? key}) : super(key: key);

  @override
  State<ContactEditScreen> createState() => _ContactEditScreenState();
}

class _ContactEditScreenState extends State<ContactEditScreen> {
  String index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Contact')),
      body: ContactEditForm(index: index),
    );
  }
}
