
import 'package:get/get.dart';

class AppController extends GetxController{
    var currentIndex = 0.obs;
    void onPageChange(int index) => currentIndex.value = index;
}
