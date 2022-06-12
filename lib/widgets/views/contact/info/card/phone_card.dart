import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/models/debt.dart';
import 'package:debting/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCard extends StatelessWidget {
  PhoneCard({Key? key}) : super(key: key);

  final _controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GetBuilder<ContactController>(
        builder: (controller) {
          bool isAvailable = _controller.contact.phone != null;

          return ListTile(
            leading: Icon(Icons.phone_rounded),
            title: Text(
              isAvailable ? '+62${_controller.contact.phone}' : 'Not Available',
            ),
            trailing: IconButton(
              onPressed:
                  isAvailable ? () => chatWhatsapp(_controller.contact) : null,
              icon: FaIcon(FontAwesomeIcons.whatsapp),
            ),
          );
        },
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
