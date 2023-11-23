// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:ecomerce/common/global_variables.dart';
import 'package:flutter/material.dart';

class CategoryWidet extends StatelessWidget {
  const CategoryWidet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: GlobalVariables.categoryIcons.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    GlobalVariables.categoryIcons[index]['icons'],
                    fit: BoxFit.cover,
                    height: 35,
                    width: 35,
                  ),
                ),
              ),
              Text(
                GlobalVariables.categoryIcons[index]['title'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
