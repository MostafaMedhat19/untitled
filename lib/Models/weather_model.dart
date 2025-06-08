class WeatherModel
{
  Map<String, dynamic>weatherData ;
  WeatherModel({required this.weatherData});
  factory WeatherModel.weatherStatus(Map<String,dynamic>data)
  {
    return WeatherModel(weatherData:
    {
      'name' : data['location']['name'] ,
      'temp_c' : data['current']['temp_c'],
      'temp_f' :data['current']['temp_f'],
      'icon' : data['current']['condition']['icon']
    });
  }
}