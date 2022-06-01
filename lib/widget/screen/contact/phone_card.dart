import 'package:debting/model/contact.dart';
import 'package:debting/util/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCard extends StatelessWidget {
  final Contact contact;
  const PhoneCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAvailable = contact.phone != null && contact.phone != '';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Icon(Icons.phone_rounded),
          title: Text(isAvailable ? contact.phone as String : 'Not Available'),
          trailing: IconButton(
            onPressed: isAvailable
                ? () async {
                    Uri url = Uri.parse(
                      'https://api.whatsapp.com/send?phone=${contact.phone!.substring(1)}&text=${_debtList(contact)}',
                    );

                    if (!await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    )) throw 'Could not launch $url';
                  }
                : null,
            icon: FaIcon(FontAwesomeIcons.whatsapp),
          ),
        ),
      ),
    );
  }

  String _debtList(Contact contact) {
    String res = 'Hi, ${contact.name}\n';

    int total = contact.sumDebt(countLend: true, countBorrow: true);

    res += 'I lend you:\n';
    for (var debt in contact.lend) {
      res +=
          '- ${DateFormat('dd/MM/yy').format(debt.date)}; ${currencyFormatter(debt.amount)}; ${debt.desc}\n';
    }

    res += '\nI borrow from you:\n';
    for (var debt in contact.borrow) {
      res +=
          '- ${DateFormat('dd/MM/yy').format(debt.date)}; ${currencyFormatter(debt.amount)}; ${debt.desc}\n';
    }

    res += '\nTherefore, ${total < 0 ? 'I owe you' : 'You owe me'}:\n';
    res += currencyFormatter(total);

    return res;
  }
}
