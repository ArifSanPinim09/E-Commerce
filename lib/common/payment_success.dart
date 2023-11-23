// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecomerce/presentation/home_page/home_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  late bool showAlert;

  @override
  void initState() {
    super.initState();
    showAlert = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (showAlert) {
      showAlert = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showAlertDialog();
      });
    }
  }

  void showAlertDialog() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Pembayaran Berhasil",
      desc: "Selamat, Pembayaran Anda Berhasil!",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
          width: 120,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
