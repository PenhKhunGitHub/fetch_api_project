import 'package:http/http.dart' as http;
import '../../features/products/models/product_model.dart';
// ignore_for_file: avoid_print

class APIService {
  Future fetchProduct()async{
    try{
      const url = "https://fakestoreapi.com/products";
      final response = await http.get(Uri.parse(url));
      print('status code : ${response.statusCode}');
      //print('All data : ${response.body}');
      if(response.statusCode == 200){
        return productModelFromJson(response.body);
      }else{
        throw Exception(response.body);
      }
    }catch(e){
      throw Exception(e);
    }
  }
}