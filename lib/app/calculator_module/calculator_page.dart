import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_binary_calculator/app/calculator_module/calculator_controller.dart';

class CalculatorPage extends GetView<CalculatorController> {
  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora binária')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildFirstValueInput(),
              SizedBox(height: 20),
              _buildSecondValueInput(),
              SizedBox(height: 30),
              _buildButtons(),
              SizedBox(height: 30),
              _buildResultText(),
              SizedBox(height: 50),
              _buildErrorText()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstValueInput() {
    return Obx(
      () => TextField(
        controller: _firstNumberController,
        decoration: InputDecoration(
          fillColor: Colors.black12,
          filled: true,
          hintText: "Insira o primeiro valor",
          errorText: controller.errorFirstNumber.value != ''
              ? controller.errorFirstNumber.value
              : null,
        ),
        onChanged: (value) =>
            controller.errorFirstNumber.value = controller.isValidValue(value),
        keyboardType:
            TextInputType.numberWithOptions(decimal: false, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-1]+')),
        ],
      ),
    );
  }

  Widget _buildSecondValueInput() {
    return Obx(
      () => TextField(
        controller: _secondNumberController,
        decoration: InputDecoration(
          fillColor: Colors.black12,
          filled: true,
          hintText: "Insira o segundo valor",
          errorText: controller.errorSecondNumber.value != ''
              ? controller.errorSecondNumber.value
              : null,
        ),
        onChanged: (value) =>
            controller.errorSecondNumber.value = controller.isValidValue(value),
        keyboardType:
            TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-1]+')),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 5,
      children: [
        _operationButton(
          '+',
          onPressed: () => controller.result.value = controller.sum(
              _firstNumberController.text, _secondNumberController.text),
        ),
        _operationButton(
          '-',
          onPressed: () => controller.result.value = controller.subtract(
              _firstNumberController.text, _secondNumberController.text),
        ),
        _operationButton(
          'x',
          onPressed: () => controller.result.value = controller.multiplication(
              _firstNumberController.text, _secondNumberController.text),
        ),
        _operationButton(
          '/',
          onPressed: () => controller.result.value = controller.division(
              _firstNumberController.text, _secondNumberController.text),
        ),
        _operationButton(
          '%',
          onPressed: () => controller.result.value = controller.modulo(
              _firstNumberController.text, _secondNumberController.text),
        ),
      ],
    );
  }

  Widget _operationButton(String text, {Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
          shape: MaterialStateProperty.all<CircleBorder>(CircleBorder()),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget _buildResultText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Resultado: ",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black38,
            fontSize: 12,
          ),
        ),
        Obx(
          () => Text(
            controller.result.value != '' ? controller.result.value : "0",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 48,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorText() {
    return Obx(
      () => Text(
        controller.errorResult.value,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
