import 'package:dio/dio.dart';
import '../Models/weather_model.dart';

class WeatherService {
  static Dio dio = Dio(); 
  static Future<WeatherModel>fatchWeather(String city)async
  {
     Response response = await dio.get('https://api.weatherapi.com/v1/current.json?q=$city&key=805d8e4621234f858ee72953251903');
     if(response.statusCode != 200)
       {
         print( response.statusCode.toString());
       }
     return WeatherModel.weatherStatus(response.data);
  }
}