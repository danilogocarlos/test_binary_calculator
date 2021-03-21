import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final errorFirstNumber = ''.obs;
  final errorSecondNumber = ''.obs;
  final errorResult = ''.obs;
  final result = ''.obs;

  int parseDecimalStringToInt(String number) =>
      int.tryParse(int.parse(number, radix: 2).toRadixString(10));

  String sum(String firstNumber, String secondNumber) {
    if (!operationValidation(firstNumber, secondNumber)) return "0";

    return (parseDecimalStringToInt(firstNumber) +
            parseDecimalStringToInt(secondNumber))
        .toRadixString(2);
  }

  String subtract(String firstNumber, String secondNumber) {
    if (!operationValidation(firstNumber, secondNumber)) return "0";

    return (parseDecimalStringToInt(firstNumber) -
            parseDecimalStringToInt(secondNumber))
        .toRadixString(2);
  }

  String multiplication(String firstNumber, String secondNumber) {
    if (!operationValidation(firstNumber, secondNumber)) return "0";

    return (parseDecimalStringToInt(firstNumber) *
            parseDecimalStringToInt(secondNumber))
        .toRadixString(2);
  }

  String division(String firstNumber, String secondNumber) {
    if (!operationValidation(firstNumber, secondNumber)) return "0";

    if (!divisionValidation(firstNumber, secondNumber)) return "0";

    return "${(parseDecimalStringToInt(firstNumber) ~/ parseDecimalStringToInt(secondNumber)).toRadixString(2)}, resto: ${(parseDecimalStringToInt(firstNumber) % parseDecimalStringToInt(secondNumber)).toRadixString(2)}";
  }

  String modulo(String firstNumber, String secondNumber) {
    if (!operationValidation(firstNumber, secondNumber)) return "0";

    if (!divisionValidation(firstNumber, secondNumber)) return "0";

    return "${(parseDecimalStringToInt(firstNumber) % parseDecimalStringToInt(secondNumber)).toRadixString(2)}";
  }

  String isValidValue(String number) =>
      int.parse(number, radix: 2) < 0 || int.parse(number, radix: 2) > 255
          ? "O valor deve ser entre 0 e 255"
          : null;

  bool operationValidation(String firstNumber, String secondNumber) {
    bool success = true;

    errorResult.value = "";
    result.value = "0";

    if (firstNumber == '') {
      errorFirstNumber.value = "Este campo não pode ser vazio";
      success = false;
    }

    if (secondNumber == '') {
      errorSecondNumber.value = "Este campo não pode ser vazio";
      success = false;
    }

    return success;
  }

  bool divisionValidation(String firstNumber, String secondNumber) {
    bool success = true;
    if (int.parse(secondNumber, radix: 2) == 0) {
      errorResult.value = "O dividendo não pode ser 0";
      success = false;
    }

    return success;
  }
}
