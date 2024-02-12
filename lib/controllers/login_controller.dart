import 'package:get/get.dart';

class LoginController extends GetxController{
   final isPasswordVisible = true.obs;
   void visiblePassword(){
      isPasswordVisible.value = !isPasswordVisible.value;
   }
}