import 'package:dio/dio.dart';
import 'package:untitled/Models/product_model.dart';

class ProductService{
  
  static Dio dio = Dio(); 
  static Future<ProductModel>getProduct()async
  {
      Response response = await dio.get('https://elsewedyteam.runasp.net/api/Product/GetProducts');
      if(response.statusCode != 200)
        {
           print( response.statusCode.toString());

        }
      print(response.data);
      return ProductModel.fetchData(response.data);
  }
}