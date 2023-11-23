// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:ecomerce/presentation/cart/widget/bottomnavbar.dart';
import 'package:ecomerce/presentation/cart/widget/card_list_product_cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Saya"),
        actions: const [],
      ),
      body: const Column(
        children: [
          Divider(),
          SizedBox(height: 5),
          CardListCartWidget(),
        ],
      ),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}
