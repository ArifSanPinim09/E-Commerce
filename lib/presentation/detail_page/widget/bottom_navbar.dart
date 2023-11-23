// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ecomerce/bloc/checkout/checkout_bloc.dart';
import 'package:ecomerce/data/model/response/list_product_response_model.dart';
import 'package:ecomerce/presentation/cart/cart_page.dart';

class BottomNavBarr extends StatefulWidget {
  Product product;
  BottomNavBarr({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<BottomNavBarr> createState() => _BottomNavBarrState();
}

class _BottomNavBarrState extends State<BottomNavBarr> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height: 80.0,
      child: Container(
        decoration: const BoxDecoration(),
        height: 200.0, // Sesuaikan tinggi sesuai kebutuhan
        // Sesuaikan padding sesuai kebutuhan
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CheckoutBloc>().add(
                        AddToCartEvent(product: widget.product),
                      );
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff67C4A7)),
                child: BlocListener<CheckoutBloc, CheckoutState>(
                  listener: (context, state) {
                    if (state is CheckoutSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CartPage();
                          },
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      if (state is CheckoutLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Text(
                        'Add to cart',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
