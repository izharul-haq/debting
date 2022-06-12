import 'package:debting/constants/screen_padding.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:debting/widgets/common/submit_input.dart';
import 'package:debting/widgets/views/contact/common/name_input.dart';
import 'package:debting/widgets/views/contact/common/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactAddForm extends StatefulWidget {
  const ContactAddForm({Key? key}) : super(key: key);

  @override
  State<ContactAddForm> createState() => _ContactAddFormState();
}

class _ContactAddFormState extends State<ContactAddForm> {
  final _controller = Get.find<DBController>();

  final _key = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _phone = TextEditingController();

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
              onSubmit: () => _controller.addContact(
                name: _name.text,
                phone: _phone.text,
              ),
              text: 'Save',
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
