import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_binary_calculator/app/calculator_module/calculator_binding.dart';
import 'package:test_binary_calculator/app/calculator_module/calculator_page.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: [
          GetPage(
              name: "/",
              page: () => CalculatorPage(),
              binding: CalculatorBinding()), // here!
        ],
        theme: ThemeData(
            primaryColor: Colors.purpleAccent,
            appBarTheme: AppBarTheme(
              color: Colors.purpleAccent,
              centerTitle: true,
            )),
      ),
    );
