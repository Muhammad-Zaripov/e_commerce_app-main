import 'dart:convert';
import 'package:e_commerce_app/models/card_model.dart';
import 'package:http/http.dart' as http;

class CardRemoteDatasources {
  final String _baseUrl =
      "https://dars46-823de-default-rtdb.firebaseio.com/shop/carts.json";

  Future<List<CartModel>> fetchCard() async {
    final url = Uri.parse("$_baseUrl/cars.json");
    final response = await http.get(url);
    final List<CartModel> cardList = [];

    if (response.statusCode != 200) {
      print("${response.statusCode} ERROR CARD RESPONSE");
      return cardList;
    }

    final decodeData = jsonDecode(response.body);

    decodeData.forEach((key, value) {
      cardList.add(CartModel.fromJson(value));
    });

    return cardList;
  }

  Future<void> postCard(CartModel car) async {
    final url = Uri.parse("$_baseUrl/cars.json");

    final response = await http.post(url, body: jsonEncode(car.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Car muvaffaqiyatli post qilindi!");
    } else {
      print("${response.statusCode} ERROR POST RESPONSE");
    }
  }
}
