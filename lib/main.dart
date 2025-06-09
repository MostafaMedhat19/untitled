import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/account_provider.dart';
import 'package:untitled/Providers/gender_random_provider.dart';
import 'package:untitled/Providers/news_provider.dart';
import 'package:untitled/Providers/product_provider.dart';
import 'package:untitled/Providers/random_user_provider.dart';
import 'package:untitled/Providers/weather_provider.dart';
import 'package:untitled/Screens/login_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AccountProvider(),),
      ChangeNotifierProvider(create: (context) => GenderProvider(),),
      ChangeNotifierProvider(create: (context) => NewsProvider(),),
      ChangeNotifierProvider(create: (context) => RandomUserProvider(),),
      ChangeNotifierProvider(create: (context) => WeatherProvider(),),
      ChangeNotifierProvider(create: (context) => ProductProvider(),),
    ] ,
      child: MaterialApp(home: LoginScreen() ,),);

  }
}

