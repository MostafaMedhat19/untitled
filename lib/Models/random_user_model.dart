class RandomModel {

  List<dynamic>users ;

  RandomModel({required this.users});
  factory RandomModel.getUsers(Map<String,dynamic>data)
  {
     return RandomModel(users: data['results']);
  }
}