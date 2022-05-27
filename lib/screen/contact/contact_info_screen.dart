import 'package:debting/screen/debt/add_debt_screen.dart';
import 'package:debting/widget/screen/contact/contact_info.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatefulWidget {
  final String uuid;

  const ContactInfoScreen({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContactInfo(
        uuid: widget.uuid,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDebtScreen(
                uuid: widget.uuid,
              ),
            ),
          );
        },
        child: Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
