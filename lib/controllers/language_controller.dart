import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController{
  var isEnglish = true.obs;
  void changuageLanguage(){
    var locale = const Locale('en', 'US');
    if(Get.locale == const Locale('en', 'US')){
      locale = const Locale('km', 'KH');
      isEnglish.value = false;
    }else{
      locale = const Locale('en', 'US');
      isEnglish.value =true;
    }
    Get.updateLocale(locale);
  }
}