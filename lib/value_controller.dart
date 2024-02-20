import 'package:get/get.dart';

class ValueController extends GetxController {
  RxString definedValue = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> setValue(String value) async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 2000));

    definedValue.value = value;
    isLoading.value = false;
  }
}
