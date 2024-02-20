import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example/user_controller.dart';

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

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  final UserController _userController = UserController();

  TextStyle commonStyle() =>
      const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /**
             * Apresentação do nome
             */
            Obx(() => Text(
                  'Name: ${_userController.user.value.name}',
                  style: commonStyle(),
                )),

            /**
             * Apresentação da idade
             */
            Obx(() => Text(
                  'Age: ${_userController.user.value.age}',
                  style: commonStyle(),
                )),
            const Divider(
              thickness: 1.5,
              color: Colors.blue,
              height: 20,
            ),
            /**
             * Name form
             */
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _userController.setUserName(nameController.text);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            /**
             * Age form
             */
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _userController.setUserAge(int.parse(ageController.text));
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
