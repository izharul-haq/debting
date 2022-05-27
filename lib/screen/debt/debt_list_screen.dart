import 'package:debting/widget/screen/debt/debt_list.dart';
import 'package:flutter/material.dart';

class DebtListScreen extends StatelessWidget {
  final String uuid;
  final String type;
  final String name;
  const DebtListScreen(
      {Key? key, required this.uuid, required this.type, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            type == 'Lend' ? '$name\'s list of Debts' : 'Your list of Debts'),
      ),
      body: DebtList(uuid: uuid, type: type),
    );
  }
}
