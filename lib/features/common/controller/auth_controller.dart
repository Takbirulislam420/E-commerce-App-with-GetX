import 'dart:convert';

import 'package:get/get.dart';
import 'package:mkr_mart/features/common/user_data_model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final String _userDataKey = "user-data";
  final String _tokenKey = "access-key";

  String? accessToken;
  UserDataModel? userDataModel;

  Future<void> saveUserData(String token, UserDataModel model) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    await sharedPreferences.setString(_tokenKey, token);
    userDataModel = model;
    accessToken = token;
  }

  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString(_userDataKey);
    String? tokenData = sharedPreferences.getString(_tokenKey);
    if (userData != null) {
      //userDataModel = jsonDecode(userData);
      userDataModel = UserDataModel.fromJson(
        jsonDecode(userData),
      ); // ✅ Correct casting
      accessToken = tokenData;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? tokenData = sharedPreferences.getString(_tokenKey);
    if (tokenData != null) {
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
  }
}
