import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final textController = TextEditingController();
  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // value
            GetX<ValueController>(
              init: valueController, // attention
              builder: (controller) {
                return Text('Value defined: ${controller.definedValue.value}');
              },
            ),

            // textfield
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: textController,
              ),
            ),

            // btn
            GetX<ValueController>(
              init: valueController,
              builder: (controller) {
                return controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;

                          valueController.setValue(value);
                        },
                        child: const Text('Confirm'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
