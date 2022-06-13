import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/routes/route_names.dart';
import 'package:debting/widgets/common/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListCard extends StatelessWidget {
  final String contactKey;
  final Contact contact;

  ContactListCard({
    Key? key,
    required this.contactKey,
    required this.contact,
  }) : super(key: key);

  final _dbController = Get.find<DBController>();
  final _contactController = Get.find<ContactController>();

  final _message = 'This will delete the selected contact. Are you sure?';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          _contactController.select(contactKey, contact);
          Get.toNamed(RouteNames.contactInfo);
        },
        leading: CircleAvatar(child: Text(contact.initials)),
        title: Text(contact.name),
        trailing: IconButton(
            onPressed: () => Get.dialog(
                  WarningDialog(
                    message: _message,
                    onAccept: () => _dbController.deleteContact(contactKey),
                  ),
                ),
            icon: Icon(Icons.delete_rounded)),
      ),
    );
  }
}
