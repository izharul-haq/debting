import 'package:debting/routes/route_names.dart';
import 'package:debting/widget/screen/contact/info/contact_info_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({Key? key}) : super(key: key);

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  String index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(
              RouteNames.contactEdit,
              arguments: index,
            ),
            icon: Icon(Icons.edit_rounded),
          ),
        ],
      ),
      body: ContactInfoDashboard(index: index),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteNames.debtAdd),
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
