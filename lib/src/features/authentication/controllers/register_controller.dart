// ignore_for_file: avoid_print

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class RegisterController extends GetxController {
  File? profileImage;

  void pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        print('Select image : $profileImage');
      } else {
        print('No image');
      }
      update(); //refresh ui after pick image
    } catch (e) {
      print('Error Pick image from galley: $e');
    }
  }
  
  final isPasswordVisible = true.obs;
   void visiblePassword(){
      isPasswordVisible.value = !isPasswordVisible.value;
   }
  
}
