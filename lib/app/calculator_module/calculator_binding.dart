import 'package:get/get.dart';
import 'package:test_binary_calculator/app/calculator_module/calculator_controller.dart';

class CalculatorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CalculatorController>(CalculatorController());
  }
}
