import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';

import '../../view_model/commpnas/PushItemCatogry.dart';
import '../wedget/CustomAppBar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customappbar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorBasic,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "شاهد المزيد",
                    style: TextStyle(
                        color: colorA,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Spacer(),
              Text(
                "الاصناف",
                style: TextStyle(
                    color: colorA, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Pushitemcatogry(),
      ],
    );
  }
}
