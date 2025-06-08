import 'package:flutter/cupertino.dart';
import 'package:untitled/Models/account_model.dart';
import 'package:untitled/Services/account_service.dart';

class AccountProvider extends ChangeNotifier
{
     AccountModel ?model;
     String massage =  "";
     bool  status  = false;
    Future<void>loginAccount(String email , String password)async
    {
          model =   await AccountService.login(email, password);
          status  = model!.status;
           massage  = model!.massage;
          notifyListeners();
          print("Provider : ${status.toString()}");
          print("Provider : ${massage.toString()}");
    }

    Future<void>signUpAccount(String email , String password , String phone , String name)async
    {
       model =  await AccountService.signUp( email ,  password ,  phone ,  name);
       status  = model!.status;
       massage  = model!.massage;
       print("Provider : ${status.toString()}");
       print("Provider : ${massage.toString()}");
      notifyListeners();
    }
}