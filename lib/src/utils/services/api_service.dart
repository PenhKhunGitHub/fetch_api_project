import 'package:http/http.dart' as http;
import '../../features/products/models/product_model.dart';

class APIService {
  Future fetchProduct()async{
    try{
      const url = "https://fakestoreapi.com/products";
      final response = await http.get(Uri.parse(url));
      // ignore: avoid_print
      print('status code : ${response.statusCode}');
      // ignore: avoid_print
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