import 'package:debting/constant/screen_padding.dart';
import 'package:debting/controller/contact_controller.dart';
import 'package:debting/model/contact.dart';
import 'package:debting/widget/common/spacing/column_spacing.dart';
import 'package:debting/widget/screen/contact/common/name_input.dart';
import 'package:debting/widget/screen/contact/common/phone_input.dart';
import 'package:debting/widget/screen/contact/common/submit_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactEditForm extends StatefulWidget {
  final String index;

  const ContactEditForm({Key? key, required this.index}) : super(key: key);

  @override
  State<ContactEditForm> createState() => _ContactEditFormState();
}

class _ContactEditFormState extends State<ContactEditForm> {
  final _controller = Get.find<ContactController>();
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();

  late Contact _contact;

  @override
  void initState() {
    super.initState();

    _contact = _controller.getContact(widget.index);

    _name.text = _contact.name;
    _phone.text = _contact.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NameInput(controller: _name),
            ColumnSpacing(),
            PhoneInput(controller: _phone),
            ColumnSpacing(),
            SubmitInput(
              formKey: _key,
              onPressed: () => _controller.editContact(
                widget.index,
                name: _name.text,
                phone: _phone.text,
                lend: _contact.lend,
                borrow: _contact.borrow,
              ),
              text: 'Edit',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();

    super.dispose();
  }
}
