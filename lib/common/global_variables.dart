import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalVariables {
  //format currency
  final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
  );
  //API
  static const baseUrl = "http://192.168.80.234:1337";
  //icosn category
  static const List<Map<String, dynamic>> categoryIcons = [
    {
      'title': 'Apparel',
      'icons': 'assets/icons/apparel.png',
    },
    {
      'title': 'School',
      'icons': 'assets/icons/belajar.png',
    },
    {
      'title': 'Sports',
      'icons': 'assets/icons/olahraga.png',
    },
    {
      'title': 'Electronic',
      'icons': 'assets/icons/elektronik.png',
    },
    {
      'title': 'All',
      'icons': 'assets/icons/category.png',
    },
  ];

  //image banner
  static const List<String> bannerImage = [
    "https://images.tokopedia.net/img/cache/1208/NsjrJu/2023/11/8/3eca446a-84e1-4460-933f-0d3dcb7a9614.jpg.webp?ect=4g",
    "https://images.tokopedia.net/img/cache/1208/NsjrJu/2023/11/9/3cd26a9b-0950-47ce-938f-f9d2986fa9cf.jpg.webp?ect=4g",
    "https://images.tokopedia.net/img/cache/1208/NsjrJu/2023/11/10/e097052a-c378-404c-b33c-bcde3fdca22b.jpg.webp?ect=4g"
  ];

  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static const selectedNavBarColor = Color(0xff67C4A7);
  static const unselectedNavBarColor = Colors.black87;
  static const String tes =
      "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3Dhttps://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D";
}
