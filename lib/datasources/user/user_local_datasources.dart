import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class UserLocalDatasource {
  final String _userKey = "user";

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);
    UserModel? user;
    if (userData != null) {
      final mapData = jsonDecode(userData);
      user = UserModel.fromJson(mapData);
    }

    return user;
  }

  Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final mapData = user.toJson();

    await prefs.setString(_userKey, jsonEncode(mapData));
  }
}
