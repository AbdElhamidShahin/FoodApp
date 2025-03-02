import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/cubit/states.dart';
import 'package:food_app/view_model/commpnas/PushItemCatogryHome.dart';

import '../../model/cubit/cubit/bloc.dart';
import '../../view_model/commpnas/PushItemCatogry.dart';
import '../wedget/CustomAppBar.dart';
import '../wedget/CustomImageHome.dart';
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
              ),
              Customrowhome(
                text: "العروض لهذا الاسبوع",
              ),
              Pushitemcatogryhome(
                tableName: 'best',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
