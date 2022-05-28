import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:debting/util/debt.dart';
import 'package:debting/util/text.dart';
import 'package:debting/widget/common/empty_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class DebtList extends StatefulWidget {
  final String uuid;
  final String type;
  const DebtList({Key? key, required this.uuid, required this.type})
      : super(key: key);

  @override
  State<DebtList> createState() => _DebtListState();
}

class _DebtListState extends State<DebtList> {
  late final Box debtBox;
  late final Contact contact;
  late final String uuid;
  late final String type;

  @override
  void initState() {
    super.initState();
    debtBox = Hive.box('debts');
    contact = debtBox.get(widget.uuid) as Contact;

    uuid = widget.uuid;
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: debtBox.listenable(),
      builder: (context, Box box, widget) =>
          _debtList(type == 'Lend' ? contact.lend : contact.borrow),
    );
  }

  Widget _debtList(List<Debt> debts) {
    return debts.isEmpty
        ? EmptyList(message: 'Yay, you don\'t have any debt')
        : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            itemCount: debts.length,
            itemBuilder: (context, index) {
              var debt = debts[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      DateFormat('dd\nMM').format(debt.date),
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  title: Text(
                    currencyFormatter(debt.amount),
                    style: TextStyle(
                      color:
                          type == 'Lend' ? Colors.green.shade700 : Colors.red,
                    ),
                  ),
                  subtitle: Text(debt.desc),
                  trailing: IconButton(
                    onPressed: () => deleteDebt(
                      context,
                      box: debtBox,
                      uuid: uuid,
                      type: type,
                    ),
                    icon: Icon(Icons.delete_rounded),
                  ),
                ),
              );
            },
          );
  }
}
