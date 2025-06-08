class GenderModel {
  List<dynamic>genderUsers ;
  GenderModel({required this.genderUsers});
  factory GenderModel.getUsers(Map<String,dynamic>data)
  {
    return GenderModel(genderUsers: data['results']);
  }
}