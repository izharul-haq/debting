import 'package:debting/controllers/contact_controller.dart';
import 'package:debting/widgets/common/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({Key? key}) : super(key: key);

  final _controller = Get.find<ContactController>();

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
        child: GetBuilder<ContactController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                child: Text(
                  _controller.contact.initials,
                  style: TextStyle(fontSize: 8.h, fontWeight: FontWeight.w500),
                ),
                radius: 15.w,
              ),
              Spacing(),
              Text(
                _controller.contact.name,
                style: TextStyle(fontSize: 6.w, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
