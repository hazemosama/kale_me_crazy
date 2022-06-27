class OrderDetailesModel {
  late final bool status;
  late final String message;
  late final Data data;

  OrderDetailesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<MyOrders> myOrders;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['My_orders'] != null) {
      myOrders = <MyOrders>[];
      json['My_orders'].forEach((v) {
        myOrders.add(new MyOrders.fromJson(v));
      });
    }
  }
}

class MyOrders {
  late final String id;
  late final Dish dish;
  late final String price;
  late final int quantity;

  MyOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dish = Dish.fromJson(json['dish']);
    price = json['price'];
    quantity = json['quantity'];
  }
}

class Dish {
  late final String id;
  late final String dishName;
  late final String dishPrice;
  late final String dishDiscription;
  late final String dishImage;
  late final String dishUrl;
  late final bool isActive;
  late final String dishCategory;
  late final List<int> favouriteDish;

  Dish.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishDiscription = json['dish_discription'];
    dishImage = json['dish_image'];
    dishUrl = json['dish_url'];
    isActive = json['is_active'];
    dishCategory = json['dish_category'];
    favouriteDish = json['favourite_dish'].cast<int>();
  }
}