import 'package:debting/widgets/views/debt/add/debt_add_form.dart';
import 'package:flutter/material.dart';

class DebtAddView extends StatelessWidget {
  const DebtAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Debt')),
      body: DebtAddForm(),
    );
  }
}
