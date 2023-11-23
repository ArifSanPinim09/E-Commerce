import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecomerce/data/model/request/login_request_model.dart';
import 'package:ecomerce/data/model/request/register_request_model.dart';
import 'package:ecomerce/data/model/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  //Register
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse("http://192.168.80.234:1337/api/auth/local/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromRawJson(response.body));
    } else {
      return const Left("Errok Cok!!");
    }
  }

  //login
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel loginRequestModel) async {
    final response = await http.post(
      Uri.parse("http://192.168.80.234:1337/api/auth/local"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: loginRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromRawJson(response.body));
    } else {
      return const Left("Error Cok");
    }
  }
}
