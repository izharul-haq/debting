import 'package:debting/screen/contact/add_contact_screen.dart';
import 'package:debting/widget/screen/contact/contact_list.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: ContactList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactScreen(),
            ),
          );
        },
        child: Icon(Icons.person_add_alt_1_rounded),
      ),
    );
  }
}
