import 'dart:convert';

import 'package:e_commerce_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRemoteDatasoursec {
  final String _baseUrl =
      "https://dars46-823de-default-rtdb.firebaseio.com/shop/user.json";

  Future<List<UserModel>> fetchUser() async {
    final url = Uri.parse("$_baseUrl/users.json");
    final response = await http.get(url);
    final List<UserModel> userList = [];

    if (response.statusCode != 200) {
      print("${response.statusCode} ERROR");
      return userList;
    }

    final decodeData = jsonDecode(response.body);

    if (decodeData is Map<String, dynamic>) {
      decodeData.forEach((key, value) {
        userList.add(UserModel.fromJson(value));
      });
    } else {
      print("Data Map formatida emas");
    }

    print("Userlar: $userList");
    return userList;
  }

  Future<void> postUser(UserModel user) async {
    final url = Uri.parse("$_baseUrl/users.json");

    final response = await http.post(url, body: jsonEncode(user.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("User muvaffaqiyatli post qilindi!");
    } else {
      print("${response.statusCode} ERROR POST RESPONSE");
    }
  }
}
