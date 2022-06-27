class SearchModel {
  late final bool status;
  late final Data data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
  late final String dishDiscription;
  late final String dishCategory;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishDiscription = json['dish_discription'];
    dishCategory = json['dish_category'];
  }

}