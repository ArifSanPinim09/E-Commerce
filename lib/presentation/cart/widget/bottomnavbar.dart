// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:ecomerce/bloc/checkout/checkout_bloc.dart';
import 'package:ecomerce/data/datasource/auth_local_datasource.dart';
import 'package:ecomerce/presentation/auth_page/register_page.dart';
import 'package:ecomerce/presentation/checkout_page/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height: 110.0,
      child: Container(
        decoration: const BoxDecoration(),
        height: 200.0, // Sesuaikan tinggi sesuai kebutuhan
        // Sesuaikan padding sesuai kebutuhan
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Substotal',
                  style: GoogleFonts.poppins(fontSize: 16.0),
                ),
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state is CheckoutSuccess) {
                      final total = state.items.fold(
                        0,
                        (sum, items) =>
                            sum +
                            double.parse(items.attributes!.price!).toInt(),
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
                  final isLogin = await AuthLoacalDataSource().checkToken();
                  if (isLogin) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const CheckOutPage();
                      },
                    ));
                  } else {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const RegisterPage();
                      },
                    ));
                  }
                  print('Checkout Pressed');
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff67C4A7)),
                child: Text(
                  'Checkout',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
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
