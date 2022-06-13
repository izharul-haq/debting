import 'package:debting/controllers/db_controller.dart';
import 'package:get/get.dart';

class DBBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DBController());
  }
}
