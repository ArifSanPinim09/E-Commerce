// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:ecomerce/bloc/checkout/checkout_bloc.dart';
import 'package:ecomerce/bloc/get_all_product/get_all_product_bloc.dart';
import 'package:ecomerce/data/model/response/list_product_response_model.dart';
import 'package:ecomerce/presentation/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListProductWidget extends StatefulWidget {
  const ListProductWidget({Key? key}) : super(key: key);

  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  void initState() {
    context.read<GetAllProductBloc>().add(DoGetProductEvemt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductBloc, GetAllProductState>(
      builder: (context, state) {
        if (state is GetAllProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetAllProductSuccess) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.5,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.data.data!.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final Product product = state.data.data![index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      product: product,
                    ),
                  ),
                ),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 233, 232, 232),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Hero(
                            tag: product.attributes!.image!,
                            child: Image.network(
                              product.attributes!.image!,
                              fit: BoxFit.fill,
                              height: 150,
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          product.attributes!.name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp',
                              ).format(
                                  double.tryParse(product.attributes!.price!) ??
                                      0),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                                "Stock: ${product.attributes!.quantity!.toString()}"),
                          ],
                        )),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff67C4A7),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<CheckoutBloc>().add(
                                          RemoveFromCartEvent(product: product),
                                        );
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 24.0,
                                    color: Colors.white,
                                  ),
                                ),
                                BlocBuilder<CheckoutBloc, CheckoutState>(
                                  builder: (context, state) {
                                    if (state is CheckoutSuccess) {
                                      final countItem = state.items
                                          .where((element) =>
                                              element.id == product.id)
                                          .length;
                                      return Text("$countItem");
                                    }
                                    return const Text("0");
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<CheckoutBloc>().add(
                                          AddToCartEvent(product: product),
                                        );
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 24.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: Text(
            "404 NOT FOUND",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        );
      },
    );
  }
}
