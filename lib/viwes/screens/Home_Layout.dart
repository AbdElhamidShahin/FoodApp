import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';

import '../../view_model/commpnas/PushItemCatogry.dart';
import '../wedget/CustomAppBar.dart';
import '../wedget/CustomRowHome.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customappbar(),
        Customrowhome(text: 'الأصناف',),
        Pushitemcatogry(),
        Customrowhome(text: "الأكثر طلبا",),

      ],
    );
  }
}
