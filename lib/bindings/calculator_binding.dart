import 'package:debting/controllers/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CalculatorController());
  }
}
