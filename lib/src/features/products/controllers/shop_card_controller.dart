import 'package:get/get.dart';

class CardController extends GetxController{
  var count  = RxInt(0);
  void increment(){
    count++;
    update();
  }
  void decrement(){
    if(count> 0){
      count--;
    }
    update(); 
  }
}