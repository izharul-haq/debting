import 'package:debting/controller/theme_controller.dart';
import 'package:get/get.dart';

class ThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}
