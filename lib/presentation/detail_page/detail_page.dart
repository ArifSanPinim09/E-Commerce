// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:ecomerce/presentation/cart/widget/bottomnavbar.dart';
import 'package:ecomerce/presentation/detail_page/widget/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:ecomerce/data/model/response/list_product_response_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  Product? product;
  DetailPage({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detail Product"),
        actions: const [],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.network(
                      widget.product!.attributes!.image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    widget.product!.attributes!.name!,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp. ',
                        ).format(
                          double.parse(
                            widget.product!.attributes!.price!,
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Stock : ${widget.product!.attributes!.quantity!.toString()}",
                        style:
                            GoogleFonts.poppins(color: const Color(0xff67C4A7)),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    widget.product!.attributes!.distributor!,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(),
                  Text(
                    "Selamat datang di pusat koleksi produk kami yang beragam, mencakup berbagai kategori untuk memenuhi kebutuhan Anda sehari-hari. Di sini, kami hadir dengan komitmen untuk menyediakan inovasi dan kualitas tinggi dalam setiap produk yang kami tawarkan.",
                    style: GoogleFonts.poppins(color: const Color(0xff393F42)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarr(
        product: widget.product!,
      ),
    );
  }
}
