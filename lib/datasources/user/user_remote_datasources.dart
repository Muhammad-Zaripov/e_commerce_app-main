import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/user_model.dart';

class UserRemoteDatasource {
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse(
        "https://e-commerce-b0752-default-rtdb.asia-southeast1.firebasedatabase.app/commerce/users.json",
      );
      final response = await http.get(url);
      final Map decodedData = jsonDecode(response.body);

      UserModel? user;
      decodedData.forEach((key, value) {
        if (value["email"] == email &&
            value["password"].toString() == password) {
          Map<String, dynamic> userData = {};
          userData["id"] = key;
          userData["email"] = value["email"];
          userData["password"] = value["password"].toString();

          user = UserModel.fromJson(userData);
        }
      });

      return user;
    } catch (e, stack) {
      print(e);
      print(stack);
      return null;
    }
  }
}
