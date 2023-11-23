import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecomerce/data/datasource/auth_local_datasource.dart';
import 'package:ecomerce/data/model/request/order_request_model.dart';
import 'package:ecomerce/data/model/response/list_order_response_model.dart';
import 'package:ecomerce/data/model/response/order_response_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel model) async {
    final tokenJwt = await AuthLoacalDataSource().getToken();
    print(model.toRawJson());
    final response = await http.post(
      Uri.parse('http://192.168.80.234:1337/api/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenJwt',
      },
      body: model.toRawJson(),
    );

    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }

  Future<Either<String, ListOrderResponseModel>> listOrder() async {
    final authData = await AuthLoacalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse(
        "http://192.168.80.234:1337/api/orders?filters[userId][\$eq]=${authData.user.id}",
      ),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.jwt}'
      },
    );
    if (response.statusCode == 200) {
      return Right(ListOrderResponseModel.fromJson(json.decode(response.body)));
    } else {
      return const Left('Error');
    }
  }
}
