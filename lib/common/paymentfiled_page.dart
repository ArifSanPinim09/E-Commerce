// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecomerce/presentation/checkout_page/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PaymenField extends StatefulWidget {
  const PaymenField({Key? key}) : super(key: key);

  @override
  State<PaymenField> createState() => _PaymenFieldState();
}

class _PaymenFieldState extends State<PaymenField> {
  @override
  void initState() {
    super.initState();
    Alert(
      context: context,
      type: AlertType.error,
      title: "Pembayaran Gagal",
      desc: "Mohon Maaf Pembayaran Anda Gagal",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const CheckOutPage();
            },
          )),
          width: 120,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
