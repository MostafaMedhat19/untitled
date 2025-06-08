import 'package:dio/dio.dart';
import 'package:untitled/Models/random_user_model.dart';

class RandomService{
  static Dio dio = Dio();
  static Future<RandomModel>randomUsers() async
  {
     Response response = await dio.get('https://randomuser.me/api/?results=50');
     if(response.statusCode != 200) {
       throw Exception(response.statusCode.toString());
      }

    return  RandomModel.getUsers(response.data);
  }
}