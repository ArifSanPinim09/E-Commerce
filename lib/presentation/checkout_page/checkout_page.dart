import 'package:ecomerce/bloc/checkout/checkout_bloc.dart';
import 'package:ecomerce/bloc/oreder/order_bloc.dart';
import 'package:ecomerce/common/snap_widget.dart';
import 'package:ecomerce/data/datasource/auth_local_datasource.dart';
import 'package:ecomerce/data/model/request/order_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final TextEditingController addresController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Checkout"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: addresController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Alamat Lengkap',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.green, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Daftar Produk",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state is CheckoutSuccess) {
                  final uniqueItem = state.items.toSet().length;
                  final dataSet = state.items.toSet();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: uniqueItem,
                      itemBuilder: (context, index) {
                        final count = state.items
                            .where(
                              (element) =>
                                  element.id == dataSet.elementAt(index).id,
                            )
                            .length;
                        return Container(
                          child: Row(
                            children: [
                              Image.network(
                                dataSet.elementAt(index).attributes!.image!,
                                fit: BoxFit.fitWidth,
                                height: 135,
                                width: 100,
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
                                                          style: GoogleFonts
                                                              .poppins(
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
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 110.0,
        child: BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (orderResponseModel) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SnapWidget(url: orderResponseModel.redirectUrl),
                  ),
                );
              },
            );
          },
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutSuccess) {
                return Container(
                  decoration: const BoxDecoration(),
                  height: 200.0, // Sesuaikan tinggi sesuai kebutuhan
                  // Sesuaikan padding sesuai kebutuhan
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: GoogleFonts.poppins(fontSize: 16.0),
                          ),
                          BlocBuilder<CheckoutBloc, CheckoutState>(
                            builder: (context, state) {
                              if (state is CheckoutSuccess) {
                                final total = state.items.fold(
                                  0,
                                  (sum, items) =>
                                      sum +
                                          int.parse(items.attributes!.price!) ??
                                      0,
                                );
                                return Text(
                                  NumberFormat.currency(
                                    locale: 'id_ID',
                                    symbol: 'Rp',
                                  ).format(total),
                                );
                              }
                              return Text(
                                'Right Text',
                                style: GoogleFonts.poppins(fontSize: 16.0),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            final userId =
                                await AuthLoacalDataSource().getUserId();
                            final total = state.items.fold(
                                0,
                                (sum, items) =>
                                    sum + int.parse(items.attributes!.price!) ??
                                    0);
                            final data = Data(
                              items: state.items
                                  .map((e) => Item(
                                      id: e.id!,
                                      productName: e.attributes!.name!,
                                      price: int.parse(e.attributes!.price!),
                                      qty: 1))
                                  .toList(),
                              totalPrice: total,
                              deliveryAddress: addresController.text,
                              courierName: 'JNE',
                              shippingCost: 22000,
                              statusOrder: 'waitingPayment',
                              userId: userId,
                            );
                            context.read<OrderBloc>().add(
                                  OrderEvent.doOrder(
                                    OrderRequestModel(data: data),
                                  ),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff67C4A7)),
                          child: Text(
                            'Bayar Sekarang',
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Text("404 NOT FOUND");
            },
          ),
        ),
      ),
    );
  }
}
