import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/caticons_icons.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/categories_layout.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/state.dart';
import 'package:untitled1/model/cart_model.dart';
import 'package:untitled1/model/change_favorites_model.dart';
import 'package:untitled1/model/change_password_model.dart';
import 'package:untitled1/model/favorites_model.dart';
import 'package:untitled1/model/home_model.dart';
import 'package:untitled1/model/order_model.dart';
import 'package:untitled1/model/product_detailes_model.dart';
import 'package:untitled1/model/reservation_model.dart';
import 'package:untitled1/model/user_model.dart';
import 'package:untitled1/resturant_app/nav_bar/cart/cart_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/favorite_screen/favorite.dart';
import 'package:untitled1/resturant_app/nav_bar/home_categories/chicken_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/home_categories/drinks_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/home_categories/home_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/home_categories/meat_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/home_categories/vegetables_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/reaervation_screen/reservation_screen.dart';
import 'package:untitled1/resturant_app/nav_bar/settings/settings_screen.dart';
import 'package:untitled1/shared/conistant/constant.dart';
import 'package:untitled1/shared/conistant/end_points.dart';
import 'package:untitled1/shared/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

//عشان اوبجيكت
  static HomeCubit get(context) => BlocProvider.of(context);

//--------------------------------------

  //الايكونات categories
  List<BottomNavigationBarItem> bottomsIcons = [
    BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: ''),
    BottomNavigationBarItem(
      icon: Icon(Caticons.chicken__3_),
      label: '',
    ),
    BottomNavigationBarItem(icon: Icon(Caticons.meat__1_), label: ''),
    BottomNavigationBarItem(
        icon: Icon(Caticons.icons8_fruits_and_vegetables_64), label: ''),
    BottomNavigationBarItem(icon: Icon(Caticons.noun_drink_1827718), label: ''),
  ];

//الاسكريناتcategories
  List<Widget> categoriesScreen = [
    HomeScreen(),
    ChickenScreen(),
    MeatScreen(),
    VegetablesScreen(),
    DrinksScreen(),
  ];

//عشان انقل بين الايكونات
  int CurrentIndex = 0;

  void ChangeNavBarIcons(int index) {
    CurrentIndex = index;
    emit(ChangeNavBarIconsState());
  }

  //-------------counter----------//
  int counter = 1;

  void min() {
    counter--;
    emit(CounterMinusState(counter));
  }

  void plus() {
    counter++;
    emit(CounterPlusState(counter));
  }

  //=============================================//
  List<BottomNavigationBarItem> bottom = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/layout/home.png',
          width: 25,
          height: 25,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Image.asset('assets/layout/booking.png', width: 25, height: 25),
        label: ''),
    BottomNavigationBarItem(
        icon: Image.asset('assets/layout/cart.png', width: 25, height: 25),
        label: ''),
    BottomNavigationBarItem(
        icon: Image.asset('assets/layout/fav.png', width: 25, height: 25),
        label: ''),
    BottomNavigationBarItem(
        icon: Image.asset('assets/layout/settings.png', width: 25, height: 25),
        label: ''),
  ];

// button nav_bar الاسكرينات
  List<Widget> screen = [
    CategoriesLayout(),
    Reservation(),
    CartScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

//عشان انقل بين الصفحات
  void ChangeNavBar(int index) {
    CurrentIndex = index;
    emit(ChangeNavBarState());
  }

//====================== Reservation==========================//
  ReservationModel? reservationModel;

  void userReservation({
    required String res_date,
    required String res_guest_count,
    required String res_time,
  }) {
    emit(ResturantReservationLoadingState());
    DioHelper.postData(
      url: RESERVATION,
      token: token,
      data: {
        'res_date': res_date,
        'res_guest_count': res_guest_count,
        'res_time': res_time,
      },
    ).then((value) {
      reservationModel = ReservationModel.fromJson(value.data);
      print(value.data);
      emit(ResturantReservationSuccessState(reservationModel));
    }).catchError((error) {
      print(error.toString());
      emit(ResturantReservationErrorState(error.toString()));
    });
  }

//______________home_____________//
  HomeAndCategoryModel? homeModel;
  Map<String, bool> favorites = {};

  Future getHomeData() async {
    emit(ResturantLoadingHomeDataStates());
    DioHelper.getData(url: HOME_AND_CATEGORY, token: token).then((value) {
      homeModel = HomeAndCategoryModel.fromJson(value.data);
      print(value.data);
      homeModel!.data.homepage.forEach((element) {
        favorites.addAll({
          element.id: element.isFavourite,
        });
      });
      homeModel!.data.category.elementAt(0).products.product.forEach((element) {
        favorites.addAll({
          element.id: element.isFavourite,
        });
      });
      homeModel!.data.category.elementAt(1).products.product.forEach((element) {
        favorites.addAll({
          element.id: element.isFavourite,
        });
      });
      homeModel!.data.category.elementAt(2).products.product.forEach((element) {
        favorites.addAll({
          element.id: element.isFavourite,
        });
      });
      homeModel!.data.category.elementAt(3).products.product.forEach((element) {
        favorites.addAll({
          element.id: element.isFavourite,
        });
      });
      emit(ResturantSuccessHomeDataStates());
    }).catchError((error) {
      print(error.toString());
      emit(ResturantErrorHomeDataStates());
    });
  }

//--------ChangeFavorites----------//
  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(String productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ResturantChangeFavoritesState());
    DioHelper.postData(
      url: FAVORITE,
      data: {
        'id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (changeFavoritesModel!.status == false) {
        favorites[productId] = !favorites[productId]!;
        emit(ResturantSuccessChangeFavoritesState(changeFavoritesModel!));
      } else {
        getFavorites();
      }
    });
  }

//-----------getFavorites-------------//
  FavoritesModel? favoritesModel;

  Future getFavorites() async {
    if (token != null) emit(ResturantLoadingGetFavoritesState());
    DioHelper.getData(url: FAVORITE, token: token).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //PrintFullText(value.data.toString());
      emit(ResturantSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ResturantErrorGetFavoritesState());
    });
  }

  //--------------get user info--------------//
  UserModel? userModel;

  void getUserData() {
    emit(LoadingAccountInfoState());
    DioHelper.getData(
      url: PROFILE_INFO,
      token: token,
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(SuccessAccountInfoState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAccountInfoState(error.toString()));
    });
  }

//--------------update user info--------------//
  void updateUserData({
    required String firstname,
    required String lastname,
    required String username,
    required String email,
    required String birthdate,
    String? address,
    String? phone,
  }) {
    emit(ResturantLoadingUpdateUserState());
    DioHelper.putData(url: PROFILE_INFO, token: token, data: {
      'first_name': firstname,
      'last_name': lastname,
      'username': username,
      'email': email,
      'birthdate': birthdate,
      'address': address,
      'phone': phone,
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      //PrintFullText(userModel.data.name);

      emit(ResturantSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ResturantErrorUpdateUserState());
    });
  }

  //------------------------------change passwords---------------------------------------//
  ChangePasswordModel? changePassword;

  void userChangePassword({
    required String old_password,
    required String new_password,
    required String confermation_password,
  }) {
    emit(ResturantChangepasswordLoadingState());
    DioHelper.postData(
            url: 'api/change-password/',
            data: {
              'old_password': old_password,
              'new_password': new_password,
              'confermation_password': confermation_password,
            },
            token: token)
        .then((value) {
      changePassword = ChangePasswordModel.fromJson(value.data);
      emit(ResturantChangepasswordSuccessState(changePassword!));
    }).catchError((error) {
      emit(ResturantChangepasswordErrorState(error.toString()));
      print(error.toString());
    });
  }

  bool male = false;
  int index = 1;

  void Radio(value) {
    // male=!male;
    index = value;
    emit(ResturantChangepasswordChangeChangeRadioState());
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void ChangePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ResturantChangepasswordCahngePasswordVisibilitySuccessState());
  }

  //--------------------------------- review ------------------------------------------//
  UserModel? review;

  void userReview({
    required String comment,
  }) {
    emit(ResturantReviewLoadingState());
    DioHelper.postData(
            url: REVIEW,
            data: {
              'comment': comment,
            },
            token: token)
        .then((value) {
      emit(ResturantReviewSuccessState());
    }).catchError((error) {
      emit(ResturantReviewErrorState(error.toString()));
    });
  }

  //----------------------------- ProductDetails ---------------------------------//
  ProductDetailsModel? productDetailsModel;

  void getProductDetails({String? productId}) {
    emit(LoadingGetProductsDetailsData());
    DioHelper.postData(
        url: PRODUCTS_DETAILS,
        token: token,
        data: {'id': productId}).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
      emit(SuccessGetProductsDetailsData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetProductsDetailsData());
    });
  }

  //----------cart-------------//
  CartModel? cartModel;

  Future getCarts() async {
    emit(CartLoadingState());
    DioHelper.getData(
      url: CART,
      token: token,
    ).then((value) {
      cartModel = CartModel.fromJson(value.data);
      emit(CartSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(CartErrorState());
    });
  }

  //=============== get order ================//
  OrderModel? orderModel;

  void getOrderData() {
    emit(ResturantLoadingOrderDataStates());
    DioHelper.getData(url: ORDER_HISTORY, token: token).then((value) {
      orderModel = OrderModel.fromJson(value.data);
      emit(ResturantSuccessOrderDataStates(orderModel!));
      print(value.data);
    }).catchError((error) {
      emit(ResturantErrorOrderDataStates());
      print(error.toString());
    });
  }

//==================checkOut==================//
  OrderModel? checkOutModel;

  void checkOutData({String? address, String? phone}) {
    emit(ResturantLoadingOrderDataStates());
    DioHelper.postData(
        url: CHECK_OUT,
        token: token,
        data: {'address': address, 'phone': phone}).then((value) {
      checkOutModel = OrderModel.fromJson(value.data);
      emit(ResturantSuccessOrderDataStates(checkOutModel!));
      print(value.data);
    }).catchError((error) {
      emit(ResturantErrorOrderDataStates());
      print(error.toString());
    });
  }

//================== addToCart ==================//

  CartModel? addToCart;

  void addCarts(productId) {
    if (token != null) {
      emit(CartAddLoadingState());
      DioHelper.postData(url: CART, data: {'id': productId}, token: token)
          .then((value) {
        addToCart = CartModel.fromJson(value.data);
        getCarts();
        emit(CartAddSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(CartAddErrorState());
      });
    }
  }

//===================deleteCarts===================//
  void deleteCarts(String productId) {
    emit(CartRemoveLoadingState());
    DioHelper.deleteData(url: CART, data: {'id': productId}, token: token)
        .then((value) {
      if (value.data['status']) {
        getCarts();
      }
      print(value.data['message']);

      emit(CartRemoveSuccessState());
    }).catchError((onError) {
      print(onError.toString());

      emit(CartRemoveErrorState());
    });
  }

//=================updateQuantityOfInCartProduct=======================//
  void updateQuantityOfInCartProduct(String inCartProductID, int quantity) {
    emit(CartLoadingUpdateQuantityState());
    DioHelper.putData(
      url: CART,
      data: {'quantity': quantity, 'id': inCartProductID},
      token: token,
    ).then((value) {
      if (value.data['status']) {
        getCarts();
      }
      emit(CartSuccessUpdateQuantityState());
    }).catchError((error) {
      print(error.toString());
      emit(CartErrorUpdateQuantityState());
    });
  }
}
