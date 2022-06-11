import 'package:debting/model/contact.dart';
import 'package:debting/widget/common/spacing/column_spacing.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContactInfoCard extends StatelessWidget {
  final Contact contact;

  const ContactInfoCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5.w),
          bottomLeft: Radius.circular(5.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Text(
                contact.initials,
                style: TextStyle(
                  fontSize: 10.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
              radius: 15.w,
            ),
            ColumnSpacing(),
            Text(
              contact.name,
              style: TextStyle(fontSize: 6.w, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
