class LoginModel {
  late final bool status;
  late final String messege;
  late final Data data;



  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    data = Data.fromJson(json['data']) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['messege'] = this.messege;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  late final String firstName;
  late final String lastName;
  late final String username;
  late final String email;
  late final String phone;
  late final String address;
  late final String token;
  late final String birthdate;
  late final bool isMale;



  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    token = json['token'];
    birthdate = json['birthdate'];
    isMale = json['is_male'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['token'] = this.token;
    data['birthdate'] = this.birthdate;
    data['is_male'] = this.isMale;
    return data;
  }
}