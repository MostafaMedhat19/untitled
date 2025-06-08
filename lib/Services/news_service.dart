import 'package:dio/dio.dart';

import '../Models/news_model.dart';

class NewsServices
{
   static Dio dio = Dio();
   static Future<NewsModel> getNews(String category) async
   {
      Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=beb27b6812424c1a8d74895e1d8afbcd');
      if(response.statusCode != 200)
        {
           print('Response Failed ');
        }
      print("news service ${response.data.toString()}");
      return NewsModel.fromJson(response.data);
   }
}