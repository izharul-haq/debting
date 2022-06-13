import 'package:debting/routes/route_names.dart';
import 'package:debting/widgets/views/contact/info/contact_info_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(RouteNames.contactEdit),
            icon: Icon(Icons.edit_rounded),
          ),
        ],
      ),
      body: ContactInfoDashboard(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteNames.debtAdd),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
