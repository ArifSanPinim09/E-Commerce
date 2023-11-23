// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:ecomerce/bloc/checkout/checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardListCartWidget extends StatefulWidget {
  const CardListCartWidget({Key? key}) : super(key: key);

  @override
  State<CardListCartWidget> createState() => _CardListCartWidgetState();
}

class _CardListCartWidgetState extends State<CardListCartWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutSuccess) {
          final uniqueItem = state.items.toSet().length;
          final dataSet = state.items.toSet();
          return Expanded(
            child: ListView.builder(
              itemCount: uniqueItem,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        child: Row(
                          children: [
                            Image.network(
                              dataSet.elementAt(index).attributes!.image!,
                              fit: BoxFit.fitWidth,
                              height: 135,
                              width: 110,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 235,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    '${dataSet.elementAt(index).attributes!.name}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 235,
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp',
                                    ).format(double.parse(dataSet
                                        .elementAt(index)
                                        .attributes!
                                        .price!)),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 235,
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'In Stock',
                                        style: TextStyle(
                                          color: Colors.teal,
                                        ),
                                        maxLines: 2,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<CheckoutBloc>()
                                                        .add(RemoveFromCartEvent(
                                                            product: dataSet
                                                                .elementAt(
                                                                    index)));
                                                  },
                                                  child: Container(
                                                    width:
                                                        30.0, // Sesuaikan ukuran sesuai kebutuhan
                                                    height:
                                                        30.0, // Sesuaikan ukuran sesuai kebutuhan
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                BlocBuilder<CheckoutBloc,
                                                    CheckoutState>(
                                                  builder: (context, state) {
                                                    if (state
                                                        is CheckoutSuccess) {
                                                      final constItem = state
                                                          .items
                                                          .where((element) =>
                                                              element.id ==
                                                              dataSet
                                                                  .elementAt(
                                                                      index)
                                                                  .id)
                                                          .length;
                                                      return Text(
                                                        constItem.toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 16.0,
                                                        ),
                                                      );
                                                    }
                                                    return const Text("0");
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<CheckoutBloc>()
                                                        .add(AddToCartEvent(
                                                            product: dataSet
                                                                .elementAt(
                                                                    index)));
                                                  },
                                                  child: Container(
                                                    width:
                                                        30.0, // Sesuaikan ukuran sesuai kebutuhan
                                                    height:
                                                        30.0, // Sesuaikan ukuran sesuai kebutuhan
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
        return const Center(
          child: Text("Product Kosong"),
        );
      },
    );
  }
}
