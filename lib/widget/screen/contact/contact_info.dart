import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:debting/screen/debt/debt_list_screen.dart';
import 'package:debting/util/debt.dart';
import 'package:debting/util/text.dart';
import 'package:debting/widget/common/sum_debt.dart';
import 'package:debting/widget/screen/contact/info_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class ContactInfo extends StatefulWidget {
  final String uuid;

  const ContactInfo({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  late Box debtBox;
  late String uuid;

  @override
  void initState() {
    super.initState();
    debtBox = Hive.box('debts');
    uuid = widget.uuid;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: debtBox.listenable(),
      builder: (context, Box box, widget) {
        var contact = box.get(uuid) as Contact;

        return LayoutBuilder(
          builder: (context, BoxConstraints viewportConstraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: viewportConstraint.maxHeight),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InfoCard(name: contact.name),
                      SumDebt(
                        name: contact.name,
                        total:
                            contact.sumDebt(countLend: true, countBorrow: true),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(child: Text('Details')),
                      ),
                      _latestDebt(
                        type: 'Lend',
                        debt: contact.lend.isEmpty ? null : contact.lend.last,
                        name: contact.name,
                      ),
                      _latestDebt(
                        type: 'Borrow',
                        debt:
                            contact.borrow.isEmpty ? null : contact.borrow.last,
                        name: contact.name,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _latestDebt({Debt? debt, required String type, required String name}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${type}ing History',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DebtListScreen(uuid: uuid, type: type, name: name),
                      ),
                    );
                  },
                  icon: Icon(Icons.more_horiz_rounded),
                ),
              ],
            ),
            Divider(thickness: 1),
            debt == null
                ? Center(child: Text('There\'re no history'))
                : ListTile(
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
          ],
        ),
      ),
    );
  }
}
