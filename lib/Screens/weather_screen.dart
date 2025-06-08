import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  String city;
   WeatherScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back), // optional
      ),
      body: Expanded(
          child: Consumer<WeatherProvider>(builder: (context, value, child) {
            var data = value.model?.weatherData;
            if(data == null)
              {
                 value.theWeather(city);

                 return Center(child: CircularProgressIndicator());
              }
             else{
              value.theWeather(city);
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.network("https:${data['icon']}", width: 200,height: 200,),
                    const SizedBox(height: 10,),
                    Text(data['name'].toString()),
                    const SizedBox(height: 10,),
                    Text(data['temp_c'].toString()),
                    const SizedBox(height: 10,),
                    Text(data['temp_f'].toString()),
                  ],
                ),
              );
            }
          },)
      ),
    );
  }
}
