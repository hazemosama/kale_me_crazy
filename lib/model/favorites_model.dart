class FavoritesModel {
  late final bool status;
  late final String message;
  late final Data data;


  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<Product> product;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
  }
}

class Product {
  late final String id;
  late final String dishName;
  late final String dishPrice;
  late final String dishImage;
  late final String dishUrl;
  late final String dishDiscription;
  late final String dishCategory;
  late final bool isFavourite;
  late final bool inCart;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishUrl = json['dish_url'];
    dishDiscription = json['dish_discription'];
    dishCategory = json['dish_category'];
    isFavourite = json['is_favourite'];
    inCart = json['in_cart'];
  }
}