import 'package:debting/model/contact.dart';
import 'package:debting/model/debt_type.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

int getTotalDebt(Box box, {bool lend = false, bool borrow = false}) {
  int total = 0;

  if (box.isNotEmpty) {
    for (int i = 0; i < box.length; i++) {
      total += (box.getAt(i) as Contact).sumDebt(
        countLend: lend,
        countBorrow: borrow,
      );
    }
  }

  return total;
}

void deleteDebt(
  BuildContext context, {
  required Box box,
  required String uuid,
  required DebtType type,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Delete Debt'),
        content: Text('Are you sure to remove this debt?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              var contact = box.get(uuid) as Contact;

              type == DebtType.lend
                  ? contact.lend.removeLast()
                  : contact.borrow.removeLast();

              box.put(
                uuid,
                Contact(
                  name: contact.name,
                  lend: contact.lend,
                  borrow: contact.borrow,
                ),
              );

              Navigator.of(context).pop();
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}
