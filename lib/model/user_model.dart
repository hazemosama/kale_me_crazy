class UserModel {
  late final bool status;
  late final dynamic message;
  late final User user;

  UserModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    user = User.fromJson(json['data']);
  }
}

class User {
  late final String firstname;
  late final String lastname;
  late final String username;
  late final String email;
  late final String phone;
  late final String address;
  late final String birthdate;
  late final bool is_male;
  late final dynamic token;

  User.fromJson(Map<String, dynamic> json){
    firstname = json['first_name'];
    lastname = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    birthdate = json['birthdate'];
    is_male = json['is_male'];
    token = json['token'];
  }
}