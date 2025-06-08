import 'package:dio/dio.dart';


import '../Models/gender_random_model.dart';

class GenderService{
  static Dio dio = Dio();
  static Future<GenderModel>genderUsers(String gender) async
  {

    Response response = await dio.get('https://randomuser.me/api/?gender=$gender&results=50');
    print('https://randomuser.me/api/?gender=$gender&results=50');
    if(response.statusCode != 200) {
      throw Exception(response.statusCode.toString());
    }
   return  GenderModel.getUsers(response.data);
  }
}