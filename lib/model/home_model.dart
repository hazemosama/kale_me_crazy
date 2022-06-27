// class HomeModel {
//   bool status;
//   String messege;
//   Data data;
//
//   HomeModel({this.status, this.messege, this.data});
//
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     messege = json['messege'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['messege'] = this.messege;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<Product> product;
//
//   Data({this.product});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['product'] != null) {
//       product = <Product>[];
//       json['product'].forEach((v) {
//         product.add(new Product.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.product != null) {
//       data['product'] = this.product.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Product {
//   String id;
//   String dishName;
//   String dishPrice;
//   String dishImage;
//   String dishUrl;
//   String dishDiscription;
//   String dishCategory;
//   bool isFavourite;
//   bool inCart;
//
//   Product(
//       {this.id,
//         this.dishName,
//         this.dishPrice,
//         this.dishImage,
//         this.dishUrl,
//         this.dishDiscription,
//         this.dishCategory,
//         this.isFavourite,
//         this.inCart});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     dishName = json['dish_name'];
//     dishPrice = json['dish_price'];
//     dishImage = json['dish_image'];
//     dishUrl = json['dish_url'];
//     dishDiscription = json['dish_discription'];
//     dishCategory = json['dish_category'];
//     isFavourite = json['is_favourite'];
//     inCart = json['in_cart'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['dish_name'] = this.dishName;
//     data['dish_price'] = this.dishPrice;
//     data['dish_image'] = this.dishImage;
//     data['dish_url'] = this.dishUrl;
//     data['dish_discription'] = this.dishDiscription;
//     data['dish_category'] = this.dishCategory;
//     data['is_favourite'] = this.isFavourite;
//     data['in_cart'] = this.inCart;
//     return data;
//   }
// }
class HomeAndCategoryModel {
  late final bool status;
  late final String message;
  late final Data data;

  HomeAndCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<Homepage> homepage;
  late final List<Category> category;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['homepage'] != null) {
      homepage = <Homepage>[];
      json['homepage'].forEach((v) {
        homepage.add(new Homepage.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }
}

class Homepage {
  late final String id;
  late final String dishName;
  late final String dishPrice;
  late final String dishImage;
  late final String dishUrl;
  late final String dishDiscription;
  late final String dishCategory;
  late final bool isActive;
  late final bool isFavourite;
  late final bool inCart;

  Homepage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishUrl = json['dish_url'];
    dishDiscription = json['dish_discription'];
    dishCategory = json['dish_category'];
    isActive = json['is_active'];
    isFavourite = json['is_favourite'];
    inCart = json['in_cart'];
  }
}

class Category {
  late final String catName;
  late final Products products;

  Category.fromJson(Map<String, dynamic> json) {
    catName = json['cat_name'];
    products = Products.fromJson(json['products']);
  }
}

class Products {
  late final List<ProductCat> product;

  Products.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <ProductCat>[];
      json['product'].forEach(
        (v) {
          product.add(new ProductCat.fromJson(v));
        },
      );
    }
  }
}

class ProductCat {
  late final String id;
  late final String dishName;
  late final String dishPrice;
  late final String dishImage;
  late final String dishUrl;
  late final String dishDiscription;
  late final String dishCategory;
  late final bool isFavourite;
  late final bool inCart;

  ProductCat.fromJson(Map<String, dynamic> json) {
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
