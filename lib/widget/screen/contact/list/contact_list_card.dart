import 'package:debting/controller/contact_controller.dart';
import 'package:debting/model/contact.dart';
import 'package:debting/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListCard extends StatelessWidget {
  final String index;
  final Contact contact;

  ContactListCard({
    Key? key,
    required this.index,
    required this.contact,
  }) : super(key: key);

  final _controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => Get.toNamed(
          RouteNames.contactInfo,
          arguments: index,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(contact.initials),
          ),
          title: Text(contact.name),
          trailing: IconButton(
            onPressed: () => _controller.deleteContact(index),
            icon: Icon(Icons.delete_rounded),
          ),
        ),
      ),
    );
  }
}
