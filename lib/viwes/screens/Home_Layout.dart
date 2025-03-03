import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/PushItemCatogry.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';

import '../../view_model/commpnas/PushItemCatogryHome.dart';
import '../wedget/CustomRowHome.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              Pushitemcatogryhome(
                tableName: 'best',
                uniqueId: '1', // معرّف فريد
              ),
              Customrowhome(
                text: "العروض لهذا الاسبوع",
              ),
              Pushitemcatogryhome(
                tableName: 'offers',
                uniqueId: '2', // معرّف فريد
              ),
            ],
          ),
        ),
      ),
    );
  }
}