import 'package:debting/model/debt_type.dart';
import 'package:debting/widget/screen/debt/debt_list.dart';
import 'package:flutter/material.dart';

class DebtListScreen extends StatelessWidget {
  final String uuid;
  final DebtType type;
  final String name;
  const DebtListScreen(
      {Key? key, required this.uuid, required this.type, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          type == DebtType.lend
              ? '$name\'s list of Debts'
              : 'Your list of Debts',
        ),
      ),
      body: DebtList(uuid: uuid, type: type),
    );
  }
}
