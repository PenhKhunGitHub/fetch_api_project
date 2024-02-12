
import 'package:fetch_api_project/models/product_model.dart';
import 'package:fetch_api_project/services/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final api = APIService();
  var productList = <ProductModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getProduct();
  }
  Future<void> getProduct()async{
    try{
      final response = await api.fetchProduct();
      if(response != null){
        productList.value = response;
      }
    }catch(e){
      throw Exception(e);
    }
  }
}