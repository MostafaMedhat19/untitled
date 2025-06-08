import 'package:flutter/cupertino.dart';

import '../Models/news_model.dart';
import '../Services/news_service.dart';

class NewsProvider extends ChangeNotifier
{
   NewsModel ?newsModel ;
   Future<void>getData(String category)async
   {
      newsModel = await NewsServices.getNews(category);
      notifyListeners();
   }
}