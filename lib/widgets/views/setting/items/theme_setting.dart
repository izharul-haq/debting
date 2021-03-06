import 'package:debting/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSetting extends StatelessWidget {
  ThemeSetting({Key? key}) : super(key: key);

  final _controller = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.dark_mode_rounded),
        title: Text('Dark Mode'),
        trailing: Obx(
          () => Switch(
            value: _controller.isDarkMode.value,
            onChanged: (bool value) => _controller.switchThemeMode(value),
          ),
        ),
      ),
    );
  }
}
