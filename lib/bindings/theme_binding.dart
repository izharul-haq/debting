import 'package:debting/controllers/theme_controller.dart';
import 'package:get/get.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}
