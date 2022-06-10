import 'package:debting/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Home'),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(RouteNames.contactList),
          icon: Icon(Icons.person_rounded),
        ),
        IconButton(
          onPressed: () => Get.toNamed(RouteNames.setting),
          icon: Icon(Icons.settings_rounded),
        )
      ],
    );
  }
}
