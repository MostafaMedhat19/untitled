import 'package:flutter/foundation.dart';
import 'package:untitled/Models/weather_model.dart';
import 'package:untitled/Services/weather_service.dart';

class WeatherProvider extends ChangeNotifier
{
   WeatherModel? model ;
   Future<void>theWeather(String city)async
   {
     model = await WeatherService.fatchWeather(city);
     notifyListeners();
   }
}