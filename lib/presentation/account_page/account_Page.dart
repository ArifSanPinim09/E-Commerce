// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:ecomerce/bloc/account/account_bloc.dart';
import 'package:ecomerce/bloc/checkout/checkout_bloc.dart';
import 'package:ecomerce/common/global_variables.dart';
import 'package:ecomerce/data/datasource/auth_local_datasource.dart';
import 'package:ecomerce/data/model/response/auth_response_model.dart';
import 'package:ecomerce/presentation/auth_page/login_page.dart';
import 'package:ecomerce/presentation/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final int _page = 1;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  User? user;
  Future<void> getUser() async {
    user = await AuthLoacalDataSource().getUser();
    setState(() {});
  }

  @override
  void initState() {
    getUser();
    context.read<AccountBloc>().add(const AccountEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Account"),
        actions: [
          IconButton(
            onPressed: () {
              AuthLoacalDataSource().removeToken();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/profile.jpg"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            user != null ? user!.username : '-',
            style: GoogleFonts.poppins(
                fontSize: 20.0, fontWeight: FontWeight.w500),
          ),
          Text(
            user != null ? user!.email : '-',
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            thickness: 2,
            height: 1,
          ),
          Text(
            'Your Order',
            style: GoogleFonts.poppins(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(child: BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: Text('No Orders'),
                  );
                },
                success: (listOrderResponseModel) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final order = listOrderResponseModel.data[index];
                        return Card(
                          elevation: 5,
                          shadowColor: const Color(0xff67C4A7),
                          child: ListTile(
                            title:
                                Text('Order : ${order.attributes.courierName}'),
                            subtitle: Text(
                              NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp. ',
                              ).format(
                                double.parse(
                                  order.attributes.totalPrice,
                                ),
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: listOrderResponseModel.data.length,
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.greyBackgroundCOlor,
        backgroundColor: GlobalVariables.backgroundColor,
        items: [
          //HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          //ACCOUNT
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AccountPage();
                      },
                    ),
                  );
                },
                child: const Icon(
                  Icons.person_outline_outlined,
                ),
              ),
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutSuccess) {
                    return badges.Badge(
                      badgeStyle: const badges.BadgeStyle(
                          elevation: 0, badgeColor: Colors.white),
                      // elevation: 0,
                      badgeContent: Text(
                        '${state.items.length}',
                        style: const TextStyle(color: Color(0xffEE4D2D)),
                      ),
                      // badgeColor: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const CartPage();
                          }));
                        },
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                        ),
                      ),
                    );
                  }
                  return const badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                        elevation: 0, badgeColor: Colors.white),
                    // elevation: 0,
                    badgeContent: Text(
                      '0',
                      style: TextStyle(color: Color(0xffEE4D2D)),
                    ),
                    // badgeColor: Colors.white,
                    child: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  );
                },
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
