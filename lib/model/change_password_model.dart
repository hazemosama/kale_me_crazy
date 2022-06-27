class ChangePasswordModel {
  late final bool status;
  late final dynamic success;
  late final dynamic message;

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
  }
}
