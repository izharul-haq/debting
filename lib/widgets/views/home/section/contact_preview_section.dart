import 'dart:math';

import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/controllers/db_controller.dart';
import 'package:debting/models/contact.dart';
import 'package:debting/routes/route_names.dart';
import 'package:debting/widgets/common/empty_list.dart';
import 'package:debting/widgets/common/section.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ContactPreviewSection extends StatelessWidget {
  ContactPreviewSection({Key? key}) : super(key: key);

  final _contactController = Get.find<ContactController>();
  final _dbController = Get.find<DBController>();

  final _message = "Oops. You haven't add any concact yet";

  @override
  Widget build(BuildContext context) {
    return Section(title: _title(), content: _content());
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Contacts',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.5.h),
        ),
        IconButton(
          onPressed: () => Get.toNamed(RouteNames.contactList),
          icon: Icon(Icons.more_horiz_rounded),
        ),
      ],
    );
  }

  Widget _content() {
    return SizedBox(
      height: 19.h,
      child: ValueListenableBuilder(
        valueListenable: _dbController.listenable,
        builder: (context, box, _) {
          return _dbController.contacts.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: min(_dbController.contacts.length, 5),
                  itemBuilder: (context, index) {
                    String _key = _dbController.keyAt(index);
                    Contact _contact = _dbController.getContact(_key);

                    return _contactCard(_key, _contact);
                  },
                )
              : EmptyList(message: _message);
        },
      ),
    );
  }

  Widget _contactCard(String key, Contact contact) {
    return SizedBox(
      width: 40.w,
      height: 19.h,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(2.w),
          onTap: () {
            _contactController.select(key, contact);
            Get.toNamed(RouteNames.contactInfo);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 2.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Text(
                    contact.initials,
                    style: TextStyle(
                      fontSize: 4.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  radius: 10.w,
                ),
                Spacing(),
                Spacing(),
                Expanded(
                  child: Text(
                    contact.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 2.h,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
