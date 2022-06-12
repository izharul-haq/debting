import 'package:debting/bindings/contact_binding.dart';
import 'package:debting/bindings/db_binding.dart';
import 'package:debting/bindings/theme_binding.dart';
import 'package:debting/routes/route_names.dart';
import 'package:debting/views/contact/contact_add_view.dart';
import 'package:debting/views/contact/contact_edit_view.dart';
import 'package:debting/views/contact/contact_info_view.dart';
import 'package:debting/views/contact/contact_list_view.dart';
import 'package:debting/views/home_view.dart';
import 'package:debting/views/setting_view.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static final List<GetPage> routes = [
    // Home route
    GetPage(name: RouteNames.home, page: () => HomeView()),

    // Setting route
    GetPage(
      name: RouteNames.setting,
      page: () => SettingView(),
      bindings: [ThemeBinding(), DBBinding()],
    ),

    // Contact (group) routes
    GetPage(
      name: RouteNames.contactList,
      page: () => ContactListView(),
      bindings: [DBBinding(), ContactBinding()],
    ),
    GetPage(
      name: RouteNames.contactAdd,
      page: () => ContactAddView(),
      binding: DBBinding(),
    ),
    GetPage(
      name: RouteNames.contactInfo,
      page: () => ContactInfoView(),
      bindings: [DBBinding(), ContactBinding()],
    ),
    GetPage(
      name: RouteNames.contactEdit,
      page: () => ContactEditView(),
      bindings: [DBBinding(), ContactBinding()],
    ),
  ];
}
