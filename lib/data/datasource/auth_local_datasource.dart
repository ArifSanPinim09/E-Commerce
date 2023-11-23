import 'dart:convert';
import 'package:ecomerce/data/model/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLoacalDataSource {
  //SAVE TOKEN
  Future<bool> saveToken(AuthResponseModel authReponseModel) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final result = await preferences.setString(
      'auth',
      jsonEncode(authReponseModel),
    );
    return result;
  }

  //HAPUS TOKEN
  Future<bool> removeToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove('auth');
  }

  //MENGAMBIL TOKEN
  Future<String> getToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final authJson = preferences.getString('auth') ?? "";
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    return authData.jwt;
  }

  //GET DATA USER
  Future<User> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final authJson = preferences.getString('auth') ?? "";
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    return authData.user;
  }

  //MENGECEK TOKEN
  Future<bool> checkToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final authJson = preferences.getString('auth');
    return authJson != null;
  }

  Future<int> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    return authData.user.id;
  }

  Future<AuthResponseModel> getAuthData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    return authData;
  }
}
