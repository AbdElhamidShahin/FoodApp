import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/view_model/commpnas/color.dart';

import '../../model/cubit/bloc.dart';
import '../../model/cubit/states.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FoodCubit(),
      child: BlocConsumer<FoodCubit, FoodState>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          var cubit = FoodCubit.get(context);

          return Scaffold(
            body: Stack(
              children: [
                cubit.currentScreen, // عرض الصفحة المختارة
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border),
                        label: 'المفضله',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: 'الطلبات',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        label: 'الرئيسيه',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline_sharp),
                        label: 'حسابي',
                      ),
                    ],
                    selectedItemColor: Colors.deepOrange,
                    iconSize: 32,
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottomNavBar(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: Colors.black,
                    backgroundColor: colorB,
                    elevation: 0,
                    selectedLabelStyle: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
