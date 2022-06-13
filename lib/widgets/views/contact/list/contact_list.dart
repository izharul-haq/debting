import 'package:debting/constants/screen_padding.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/widgets/common/empty_list.dart';
import 'package:debting/widgets/views/contact/list/contact_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactList extends StatelessWidget {
  ContactList({Key? key}) : super(key: key);

  final _controller = Get.find<DBController>();

  final String _message = "Oops, you haven't add any contact yet";

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.listenable,
      builder: (context, box, _) {
        return _controller.contacts.isNotEmpty
            ? ListView.builder(
                itemCount: _controller.contacts.length,
                padding: screenPadding,
                itemBuilder: (context, index) {
                  String _key = _controller.keyAt(index);
                  Contact _contact = _controller.getContact(_key);

                  return ContactListCard(contactKey: _key, contact: _contact);
                },
              )
            : EmptyList(message: _message);
      },
    );
  }
}
