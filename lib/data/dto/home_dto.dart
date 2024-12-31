
class  HomeDto{

  List<User> ?users;

  HomeDto.fromJson(Map<String, dynamic> json){
    users = ((json['users'] ?? []) as List).map((e)=> User.fromJson(e)).toList();
  }
}

class User{
  String ? name;
  String ? email;
  String ? image;
  String ? gender;

  User({this.name,this.email,this.gender,this.image});


  factory User.fromJson(Map<String,dynamic> json){
    return User(
      name : json['firstName'],
      email : json['email'],
      gender : json['gender'],
      image : json['image'],
    );
  }
}