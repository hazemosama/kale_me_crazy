class CartModel {
  bool? status;
  String? message;
  Data? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CartItem>? cartItem;
  double? totalPrice;

  Data({this.cartItem, this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart_item'] != null) {
      cartItem = <CartItem>[];
      json['cart_item'].forEach((v) {
        cartItem!.add(new CartItem.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartItem != null) {
      data['cart_item'] = this.cartItem!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class CartItem {
  String? id;
  Dish? dish;
  String? price;
  int? quantity;

  CartItem({this.id, this.dish, this.price, this.quantity});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dish = json['dish'] != null ? new Dish.fromJson(json['dish']) : null;
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.dish != null) {
      data['dish'] = this.dish!.toJson();
    }
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Dish {
  String? id;
  String? dishName;
  String? dishPrice;
  String? dishDiscription;
  String? dishImage;
  String? dishUrl;
  bool? isActive;
  String? dishCategory;
  List<int>? favouriteDish;

  Dish(
      {this.id,
        this.dishName,
        this.dishPrice,
        this.dishDiscription,
        this.dishImage,
        this.dishUrl,
        this.isActive,
        this.dishCategory,
        this.favouriteDish});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dish_name'] = this.dishName;
    data['dish_price'] = this.dishPrice;
    data['dish_discription'] = this.dishDiscription;
    data['dish_image'] = this.dishImage;
    data['dish_url'] = this.dishUrl;
    data['is_active'] = this.isActive;
    data['dish_category'] = this.dishCategory;
    data['favourite_dish'] = this.favouriteDish;
    return data;
  }
}