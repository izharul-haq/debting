import 'dart:math';

import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:debting/util/text.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          var total = contact.sumDebt();

          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _cardInfo(contact.name),
                  SizedBox(height: 10),
                  _totalDebt(total, contact.name),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Details',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  _debtHistory(contact.lend, 'Lending History'),
                  SizedBox(height: 10),
                  _debtHistory(contact.borrow, 'Borrowing History'),
                ],
              ),
            ),
          );
        });
  }

  Widget _cardInfo(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Text(
                getInitials(name),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalDebt(int total, String name) {
    final iOwe = total < 0;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(iOwe ? 'You owe $name' : '$name owe you'),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                currencyFormatter(total),
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: iOwe ? Colors.red : Colors.green.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _debtHistory(List<Debt> debts, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(height: 5),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: min(debts.length, 5),
            //     itemBuilder: (context, index) {
            //       var debt = debts[index];

            //       return ListTile(
            //         title: Text(currencyFormatter(debt.amount)),
            //         subtitle: Text(
            //           debt.desc,
            //           maxLines: 1,
            //           style: TextStyle(overflow: TextOverflow.ellipsis),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
