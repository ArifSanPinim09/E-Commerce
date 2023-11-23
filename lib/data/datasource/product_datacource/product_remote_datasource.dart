import 'dart:convert';
import 'package:ecomerce/data/datasource/auth_local_datasource.dart';
import 'package:ecomerce/data/model/response/list_order_response_model.dart';
import 'package:ecomerce/data/model/response/list_product_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class ProductRemoteDataSource {
  Future<Either<String, ListProductResponseModel>> getAllProduct() async {
    final response =
        await http.get(Uri.parse('http://192.168.80.234:1337/api/products'));

    if (response.statusCode == 200) {
      return Right(
          ListProductResponseModel.fromJson(json.decode(response.body)));
    } else {
      return const Left('proses gagal');
    }
  }

  Future<Either<String, ListProductResponseModel>> search(String name) async {
    final response = await http.get(
      Uri.parse(
        "http://192.168.80.234:1337/api/products?filters[name][\$contains]=$name",
      ),
    );

    if (response.statusCode == 200) {
      return Right(
        ListProductResponseModel.fromJson(json.decode(response.body)),
      );
    } else {
      return const Left("Error");
    }
  }
}
