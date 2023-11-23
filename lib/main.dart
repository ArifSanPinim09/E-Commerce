// import 'package:ecomerce/bloc/bloc/search_bloc.dart';
import 'package:ecomerce/bloc/account/account_bloc.dart';
import 'package:ecomerce/bloc/checkout/checkout_bloc.dart';
import 'package:ecomerce/bloc/get_all_product/get_all_product_bloc.dart';
import 'package:ecomerce/bloc/login/login_bloc.dart';
import 'package:ecomerce/bloc/oreder/order_bloc.dart';
import 'package:ecomerce/bloc/register/register_bloc.dart';
import 'package:ecomerce/bloc/search/search_bloc.dart';
import 'package:ecomerce/data/datasource/auth_remote_datasource.dart';
import 'package:ecomerce/data/datasource/product_datacource/order_remote_datasource.dart';

import 'package:ecomerce/data/datasource/product_datacource/product_remote_datasource.dart';
import 'package:ecomerce/presentation/home_page/home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllProductBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => OrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => SearchBloc(ProductRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => AccountBloc(OrderRemoteDatasource()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        ),
        home: const HomePage(),
      ),
    );
  }
}
