import 'package:debting/screen/contact/edit_contact_screen.dart';
import 'package:debting/screen/debt/add_debt_screen.dart';
import 'package:debting/widget/screen/contact/contact_info.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatelessWidget {
  final String uuid;
  const ContactInfoScreen({Key? key, required this.uuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditContactScreen(uuid: uuid),
                  ),
                );
              },
              icon: Icon(Icons.edit_rounded))
        ],
      ),
      body: ContactInfo(uuid: uuid),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDebtScreen(uuid: uuid)),
          );
        },
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
