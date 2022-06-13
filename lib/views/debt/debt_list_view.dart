import 'package:debting/models/debt.dart';
import 'package:debting/widgets/views/debt/list/debt_list_full.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebtListView extends StatefulWidget {
  const DebtListView({Key? key}) : super(key: key);

  @override
  State<DebtListView> createState() => _DebtListViewState();
}

class _DebtListViewState extends State<DebtListView> {
  final DebtType _type = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_type == DebtType.lend ? 'Lending' : 'Borrowing'} List'),
      ),
      body: DebtListFull(type: _type),
    );
  }
}
