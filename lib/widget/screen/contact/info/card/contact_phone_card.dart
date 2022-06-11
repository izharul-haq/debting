import 'package:debting/model/contact.dart';
import 'package:debting/model/debt.dart';
import 'package:debting/util/currency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPhoneCard extends StatelessWidget {
  final Contact contact;

  const ContactPhoneCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAvailable = contact.phone != null;

    return Card(
      child: ListTile(
        leading: Icon(Icons.phone_rounded),
        title: Text(
          contact.phone != null ? '+62${contact.phone}' : 'Not Available',
        ),
        trailing: IconButton(
          onPressed: isAvailable ? () => chatWhatsapp(contact) : null,
          icon: FaIcon(FontAwesomeIcons.whatsapp),
        ),
      ),
    );
  }

  void chatWhatsapp(Contact contact) async {
    // Generate message to send
    String message = 'Hi ${contact.name}\n';

    message += 'I lend you:\n';
    for (Debt debt in contact.lend) {
      message +=
          '- ${DateFormat('dd/MM/yy').format(debt.date)}; ${CurrencyUtils.format(debt.amount)}; ${debt.desc}\n';
    }

    message += '\nI borrow from you:\n';
    for (Debt debt in contact.borrow) {
      message +=
          '- ${DateFormat('dd/MM/yy').format(debt.date)}; ${CurrencyUtils.format(debt.amount)}; ${debt.desc}\n';
    }

    int total = contact.sum(includeLend: true, includeBorrow: true);

    message += '\nTherefore, ${total < 0 ? 'I owe you' : 'You owe me'}:\n';
    message += CurrencyUtils.format(total.abs());

    // Send message
    Uri url = Uri.parse(
        'https://api.whatsapp.com/send?phone=62${contact.phone!}&text=$message');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
