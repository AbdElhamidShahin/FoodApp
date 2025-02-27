import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';

import '../../view_model/commpnas/PushItemCatogry.dart';
import '../wedget/CustomAppBar.dart';
import '../wedget/CustomImageHome.dart';
import '../wedget/CustomRowHome.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Customappbar(text: "Happy Meal",),
              Customrowhome(
                text: 'الأصناف',
              ),
              Pushitemcatogry(),
              Customrowhome(
                text: "الأكثر طلبا",
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Customimagehome(
                      text: 'بان كيك',
                      image: 'assets/ImageFood/bankik.jpg',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Customimagehome(
                      text: 'بيتزا بالخضار',
                      image: 'assets/ImageFood/pizzaVegatable.jpg',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Customimagehome(
                      text: 'تشكن برجر',
                      image: 'assets/ImageFood/chekenburger.jpg',
                    ),
                  ],
                ),
              ),
              Customrowhome(
                text: "العروض لهذا الاسبوع",
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Customimagehome(
                      text: 'ستيك',
                      image: 'assets/ImageFood/0000.jpg',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Customimagehome(
                      text: 'كيك',
                      image: 'assets/ImageFood/000.jpg',
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Customimagehome(
                      text: 'بيتزا لحم',
                      image: 'assets/ImageFood/00.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
