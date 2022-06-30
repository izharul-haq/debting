import 'package:debting/constants/screen_padding.dart';
import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/utils/currency.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:debting/widgets/common/submit_input.dart';
import 'package:debting/widgets/views/debt/common/amount_input.dart';
import 'package:debting/widgets/views/debt/common/date_input.dart';
import 'package:debting/widgets/views/debt/common/desc_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DebtEditForm extends StatefulWidget {
  final int index;
  final DebtType type;

  const DebtEditForm({
    Key? key,
    required this.index,
    required this.type,
  }) : super(key: key);

  @override
  State<DebtEditForm> createState() => _DebtEditFormState();
}

class _DebtEditFormState extends State<DebtEditForm> {
  final _contactController = Get.find<ContactController>();
  final _dbController = Get.find<DBController>();

  final _key = GlobalKey<FormState>();

  final _amount = TextEditingController();
  final _desc = TextEditingController();
  final _date = TextEditingController();

  late Debt _debt;

  @override
  void initState() {
    super.initState();

    _debt = widget.type == DebtType.lend
        ? _contactController.contact.lend[widget.index]
        : _contactController.contact.borrow[widget.index];

    _amount.text = CurrencyUtils.format(_debt.amount).substring(2);
    _desc.text = _debt.desc;
    _date.text = DateFormat('yyyy-MM-dd').format(_debt.date);
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
            AmountInput(controller: _amount, initial: _debt.amount),
            Spacing(),
            DescInput(controller: _desc),
            Spacing(),
            DateInput(controller: _date),
            Spacing(),
            SubmitInput(
              formKey: _key,
              onSubmit: () {
                _contactController.editDebt(
                  widget.type,
                  widget.index,
                  amount: _amount.text,
                  desc: _desc.text,
                  date: _date.text,
                );

                _dbController.editContact(
                  _contactController.key,
                  _contactController.contact,
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
    _amount.dispose();
    _date.dispose();
    _desc.dispose();
    super.dispose();
  }
}
