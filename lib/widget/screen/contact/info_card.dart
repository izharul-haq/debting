import 'package:debting/util/text.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name;
  const InfoCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Text(getInitials(name), style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 10),
            Text(name, style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
