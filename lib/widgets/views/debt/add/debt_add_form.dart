import 'package:debting/constants/screen_padding.dart';
import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:debting/widgets/common/submit_input.dart';
import 'package:debting/widgets/views/debt/add/type_input.dart';
import 'package:debting/widgets/views/debt/common/amount_input.dart';
import 'package:debting/widgets/views/debt/common/date_input.dart';
import 'package:debting/widgets/views/debt/common/desc_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DebtAddForm extends StatefulWidget {
  const DebtAddForm({Key? key}) : super(key: key);

  @override
  State<DebtAddForm> createState() => _DebtAddFormState();
}

class _DebtAddFormState extends State<DebtAddForm> {
  final _contactController = Get.find<ContactController>();
  final _dbController = Get.find<DBController>();

  final _key = GlobalKey<FormState>();

  final _amount = TextEditingController();
  final _desc = TextEditingController();
  final _date = TextEditingController();

  DebtType? _type;

  @override
  void initState() {
    super.initState();

    _date.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
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
            TypeInput(
              value: _type,
              onChanged: (DebtType? type) => setState(() => _type = type),
            ),
            Spacing(),
            AmountInput(controller: _amount),
            Spacing(),
            DescInput(controller: _desc),
            Spacing(),
            DateInput(controller: _date),
            Spacing(),
            SubmitInput(
              formKey: _key,
              onSubmit: () {
                _contactController.addDebt(
                  _type as DebtType,
                  amount: _amount.text,
                  desc: _desc.text,
                  date: _date.text,
                );

                _dbController.editContact(
                  _contactController.key,
                  _contactController.contact,
                );
              },
              text: 'Save',
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amount.dispose();
    _date.dispose();
    _desc.dispose();
    super.dispose();
  }
}
