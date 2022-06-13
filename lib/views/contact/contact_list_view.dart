import 'package:debting/routes/route_names.dart';
import 'package:debting/widgets/views/contact/list/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: ContactList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteNames.contactAdd),
        child: Icon(Icons.person_add_rounded),
      ),
    );
  }
}
