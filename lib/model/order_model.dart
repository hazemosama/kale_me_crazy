class OrderModel {
  late final bool status;
  late final String message;
  late final Data data;

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<MyOrder> myOrder;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['My_order'] != null) {
      myOrder = <MyOrder>[];
      json['My_order'].forEach((v) {
        myOrder.add(new MyOrder.fromJson(v));
      });
    }
  }
}

class MyOrder {
  late final String id;
  late final String orderDate;
  late final List<OrderContain> orderContain;
  late final double totalPrice;

  MyOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDate = json['order_date'];
    if (json['order_contain'] != null) {
      orderContain = <OrderContain>[];
      json['order_contain'].forEach((v) {
        orderContain.add(new OrderContain.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

}

class OrderContain {
  late final String id;
  late final String dishName;
  late final String dishPrice;
  late final String dishDiscription;
  late final String dishImage;
  late final String dishUrl;
  late final bool isActive;
  late final String dishCategory;
  late final List<int> favouriteDish;

  OrderContain.fromJson(Map<String, dynamic> json) {
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
