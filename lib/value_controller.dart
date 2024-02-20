import 'package:get/get_state_manager/get_state_manager.dart';

class ValueController extends GetxController {
  String definedValue = '';

  bool isLoading = false;

  Future<void> setValue(String value) async {
    isLoading = true;
    update();

    await Future.delayed(const Duration(milliseconds: 2000));

    definedValue = value;

    isLoading = false;
    update();
  }
}
