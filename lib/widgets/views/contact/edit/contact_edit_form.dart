import 'package:debting/constants/screen_padding.dart';
import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:debting/widgets/common/submit_input.dart';
import 'package:debting/widgets/views/contact/common/name_input.dart';
import 'package:debting/widgets/views/contact/common/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactEditForm extends StatefulWidget {
  const ContactEditForm({Key? key}) : super(key: key);

  @override
  State<ContactEditForm> createState() => _ContactEditFormState();
}

class _ContactEditFormState extends State<ContactEditForm> {
  final _dbController = Get.find<DBController>();
  final _contactController = Get.find<ContactController>();

  final _key = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _phone = TextEditingController();

  @override
  void initState() {
    super.initState();

    _name.text = _contactController.contact.name;
    _phone.text = _contactController.contact.phone ?? '';
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
            Spacing(),
            PhoneInput(controller: _phone),
            Spacing(),
            SubmitInput(
              formKey: _key,
              onSubmit: () {
                Contact updatedContact = _contactController.updateContact(
                  name: _name.text,
                  phone: _phone.text,
                );

                _dbController.editContact(
                  _contactController.key,
                  updatedContact,
                );
              },
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
