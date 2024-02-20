import 'package:get/get.dart';
import 'package:getx_example/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;

  void setUserName(String username) {
    user.update((obj) {
      obj?.name = username;
    });

    // another way
    user.value.name = username;
    user.refresh();
  }

  void setUserAge(int age) {
    user.update((obj) {
      obj?.age = age;
    });
  }
}
