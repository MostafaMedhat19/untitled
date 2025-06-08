import 'package:dio/dio.dart';
import 'package:untitled/Models/account_model.dart';

class AccountService {
  
  static Dio dio = Dio(); 
  static Future<AccountModel>login(String email , String password) async
  {
    try
        {
          Response response = await dio.post('https://elsewedyteam.runasp.net/api/Login/CheckUser',
              data:{'Email' : email , 'Password' : password} );


            print("Service : ${response.data['status'].toString()}");
            print("Service : ${response.data['message'].toString()}");
            return  AccountModel.theStatus(response.data['status'], response.data['message']);


        }
        catch(ex)
    {
      print(ex);
      throw Exception('Something went wrong');

    }
  }
  static Future<AccountModel>signUp(String email , String password , String phone , String name) async
  {
    try
    {
      Response response = await dio.post('https://elsewedyteam.runasp.net/api/Register/AddUser',
          data:{'Email' : email , 'Password' : password , 'Name' :name , 'Phone': phone} );

      print("Service : ${response.data['status'].toString()}");
      print("Service : ${response.data['message'].toString()}");
      return  AccountModel.theStatus(response.data['status'], response.data['message']);

    }
    catch(ex)
    {
      print(ex);
      throw Exception('Something went wrong');

    }
  }
} 