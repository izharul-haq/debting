import 'package:debting/model/contact.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Contact contact;
  const InfoCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Text(
                contact.getInitials(),
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 10),
            Text(
              contact.name,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
