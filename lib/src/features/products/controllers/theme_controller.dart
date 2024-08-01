import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
  var isDark = false.obs;

  void changeTheme(value){
    if(value == true){
      isDark.value = true;
      Get.changeTheme(
        ThemeData.dark()
      );
    }else{
      isDark.value = false;
      Get.changeTheme(
        ThemeData.light()
      );
    }
    //update();
  }
}