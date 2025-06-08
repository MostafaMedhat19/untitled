class AccountModel
{
   bool status ;
   String massage ;
   AccountModel({required this.massage ,required this.status});
   factory AccountModel.theStatus(bool status , String massage)
   {
      print("Model :${status.toString()}");
      print("Model :${massage.toString()}");
      return AccountModel(massage: massage, status: status);
   }
}