import 'package:debting/binding/theme_binding.dart';
import 'package:debting/routes/route_names.dart';
import 'package:debting/screen/contact/contact_list_screen.dart';
import 'package:debting/screen/home_screen.dart';
import 'package:debting/screen/setting_screen.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static final list = [
    GetPage(name: RouteNames.home, page: () => HomeScreen()),
    GetPage(
      name: RouteNames.setting,
      page: () => SettingScreen(),
      bindings: [
        ThemeBinding(),
      ],
    ),
    GetPage(name: RouteNames.contactList, page: () => ContactListScreen()),
  ];
}
