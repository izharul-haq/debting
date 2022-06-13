import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends GetxController {
  final Box _box = Hive.box<dynamic>('settings');
  final String _key = 'isDarkMode';

  late var isDarkMode = _loadFromBox().obs;

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  bool _loadFromBox() => _box.get(_key) ?? false;

  void _saveThemeMode(bool isDarkMode) => _box.put(_key, isDarkMode);

  void switchThemeMode(bool value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    _saveThemeMode(value);
  }
}
