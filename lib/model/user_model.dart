class UserModel {

  UserModel({required this.userId,required this.userName,required this.userEmail,});

  late String userName;
  late String userEmail;
  late String userId;




  Map<String,dynamic> toJson() {
    final data = <String,dynamic>{};

    data["userId"]=userId;
    data["userName"]=userName;
    data["userEmail"]=userEmail;

    return data;

  }
}