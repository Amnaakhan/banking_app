import 'package:get/get.dart';

import '../../Model/user_model.dart';
import '../../service/auth_service.dart';

class AuthViewModel extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<UserModel>();
  var error = ''.obs;


  final AuthService _authService = AuthService();

  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      UserModel result = await _authService.login(email, password);
      user.value = result;
      Get.snackbar("Success", "Welcome ${result.name}");
      // Navigate to Home or Dashboard
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
  Future<void> signUp(String name, String email, String password) async {
    isLoading.value = true;
    error.value = '';
    try {
      final result = await AuthService.signUp(name: name, email: email, password: password);
      if (result['status'] == true) {
        user.value = UserModel.fromJson(result['data']);
        Get.snackbar("Success", result['message']);
      } else {
        error.value = result['message'];
        Get.snackbar("Error", error.value);
      }
    } catch (e) {
      error.value = e.toString();
      Get.snackbar("Exception", error.value);
    } finally {
      isLoading.value = false;
    }
  }
}
