import 'package:debting/binding/contact_binding.dart';
import 'package:debting/binding/theme_binding.dart';
import 'package:debting/routes/route_names.dart';
import 'package:debting/screen/contact/contact_add_screen.dart';
import 'package:debting/screen/contact/contact_edit_screen.dart';
import 'package:debting/screen/contact/contact_info_screen.dart';
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
        ContactBinding(),
      ],
    ),
    GetPage(
      name: RouteNames.contactList,
      page: () => ContactListScreen(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: RouteNames.contactAdd,
      page: () => ContactAddScreen(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: RouteNames.contactInfo,
      page: () => ContactInfoScreen(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: RouteNames.contactEdit,
      page: () => ContactEditScreen(),
      binding: ContactBinding(),
    ),
  ];
}
