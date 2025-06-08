import 'package:flutter/cupertino.dart';
import 'package:untitled/Models/random_user_model.dart';
import 'package:untitled/Services/random_user_service.dart';

class RandomUserProvider extends ChangeNotifier
{
  RandomModel ?model ;
  Future<void>getRandom()async
  {

    model = await RandomService.randomUsers();
    notifyListeners();
  }
}