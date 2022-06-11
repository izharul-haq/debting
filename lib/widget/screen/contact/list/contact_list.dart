import 'package:debting/constant/screen_padding.dart';
import 'package:debting/controller/contact_controller.dart';
import 'package:debting/model/contact.dart';
import 'package:debting/widget/screen/contact/list/contact_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactList extends StatelessWidget {
  ContactList({Key? key}) : super(key: key);

  final _controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.listenable,
      builder: (context, box, widget) => ListView.builder(
        itemCount: _controller.contacts.length,
        padding: screenPadding,
        itemBuilder: ((context, index) {
          String _key = _controller.getKey(index);
          Contact _contact = _controller.getContact(_key);

          return ContactListCard(index: _key, contact: _contact);
        }),
      ),
    );
  }
}
