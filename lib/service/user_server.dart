import 'package:e_commerce_app/data/datasoursec/cart_remoute_datasoursec.dart';
import 'package:e_commerce_app/data/datasoursec/product_remote_datasoursec.dart';
import 'package:e_commerce_app/data/datasoursec/user_remote_datasoursec.dart';
import 'package:e_commerce_app/models/card_model.dart';
import 'package:e_commerce_app/models/order_model.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/models/user_model.dart';

class AppService {
  final UserRemoteDatasoursec _userRemoteDatasoursec =
      UserRemoteDatasoursec(); // To‘g‘ri instansiyalash
  final ProductRemoteDatasoursec _productRemoteDatasoursec =
      ProductRemoteDatasoursec();
  // final OrderRemoteDatasoursec _orderRemoteDatasoursec =
  //     OrderRemoteDatasoursec();
  final CardRemoteDatasources _cardRemoteDatasources = CardRemoteDatasources();

  List<UserModel> users = [];
  List<ProductModel> products = [];
  List<OrderModel> orders = [];
  List<CartModel> cards = [];

  Future<List<UserModel>> getUsers() async {
    return await _userRemoteDatasoursec
        .fetchUser(); // Bu yerda metodni to‘g‘ri chaqirayapsiz
  }

  Future<void> getProducts() async {
    products = await _productRemoteDatasoursec.fetchProducts();
  }

  Future<void> getCards() async {
    cards = await _cardRemoteDatasources.fetchCard();
  }

  addUsers({required String email, required String password}) {
    _userRemoteDatasoursec.postUser(
      UserModel(email: email, password: password),
    );
  }
}
