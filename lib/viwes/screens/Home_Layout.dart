import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/PushItemCatogryHome.dart';
import 'package:food_app/view_model/commpnas/color.dart';

import '../../view_model/commpnas/PushItemCatogry.dart';
import '../wedget/CustomAppBar.dart';
import '../wedget/CustomImageHome.dart';
import '../wedget/CustomRowHome.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, this.item});
  final Item? item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Customappbar(
                text: "Happy Meal",
              ),
              Customrowhome(
                text: 'الأصناف',
              ),
              Pushitemcatogry(),
              Customrowhome(
                text: "الأكثر طلبا",
              ),
              item != null
                  ? CustomImageHome(item: item!)
                  : const SizedBox.shrink(),
              Customrowhome(
                text: "العروض لهذا الاسبوع",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
