class ReservationModel {
  late final bool status;
  late final dynamic message;
  late final Data data;

  ReservationModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<Info> info;

  Data.fromJson(Map<String, dynamic> json){
    info = List.from(json['info']).map((e)=>Info.fromJson(e)).toList();
  }

}

class Info {
  late final int id;
  late final dynamic resDate;
  late final int resGuestCount;
  late final dynamic resTime;
  late final bool resIsConfermed;

  Info.fromJson(Map<String, dynamic> json){
    id = json['id'];
    resDate = json['res_date'];
    resGuestCount = json['res_guest_count'];
    resTime = json['res_time'];
    resIsConfermed = json['res_is_confermed'];
  }

}