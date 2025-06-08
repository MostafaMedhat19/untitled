import 'package:flutter/cupertino.dart';
import 'package:untitled/Models/gender_random_model.dart';
import 'package:untitled/Services/gender_random_service.dart';

class GenderProvider extends ChangeNotifier
{
  GenderModel ?model ;
   Future<void>getGender(String gender)async
   {
     print(gender);

      model = await GenderService.genderUsers(gender);
      notifyListeners();
   }
}