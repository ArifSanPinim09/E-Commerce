import 'package:meta/meta.dart';
import 'dart:convert';

class ListOrderResponseModel {
  final List<Order> data;
  final Meta meta;

  ListOrderResponseModel({
    required this.data,
    required this.meta,
  });

  factory ListOrderResponseModel.fromRawJson(String str) =>
      ListOrderResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      ListOrderResponseModel(
        data: List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Order {
  final int id;
  final Attributes attributes;

  Order({
    required this.id,
    required this.attributes,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  final List<Item> items;
  final String totalPrice;
  final String courierName;
  final String shippingCost;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String deliveryAddress;
  final String statusOrder;
  final int userId;

  Attributes({
    required this.items,
    required this.totalPrice,
    required this.courierName,
    required this.shippingCost,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.deliveryAddress,
    required this.statusOrder,
    required this.userId,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalPrice: json["totalPrice"],
        courierName: json["courierName"],
        shippingCost: json["shippingCost"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        deliveryAddress: json["deliveryAddress"],
        statusOrder: json["statusOrder"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "courierName": courierName,
        "shippingCost": shippingCost,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "deliveryAddress": deliveryAddress,
        "statusOrder": statusOrder,
        "userId": userId,
      };
}

class Item {
  final int id;
  final String productName;
  final int price;
  final int qty;

  Item({
    required this.id,
    required this.productName,
    required this.price,
    required this.qty,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "price": price,
        "qty": qty,
      };
}

class Meta {
  final Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
