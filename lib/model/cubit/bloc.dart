import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/states.dart';
import 'package:food_app/viwes/screens/vv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../view_model/commpnas/PushItemCatogry.dart';
import '../../viwes/screens/Account_Screen.dart';
import '../../viwes/screens/Card_Screen.dart';
import '../../viwes/screens/CatogaryScreen.dart';
import '../../viwes/screens/Favorite_Screen.dart';
import '../../viwes/screens/Home_Layout.dart';
import 'item.dart';
import 'package:food_app/model/cubit/item.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super((TravelInitialState()));

  static FoodCubit get(context) => BlocProvider.of<FoodCubit>(context);

  int currentIndex = 0;

  List<Widget> screens = [
    AccountScreen(),
    CardScreen(),
    HomeLayout(),
    FavoriteScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {}
    emit(TravelBottomnavBarState());
  }

  final List<Map<String, dynamic>> items = [
    {
      'urlImage': 'assets/imageCatogry/dish-washing.png',
      'name': 'الوجبات',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => FoodCubit()..fetchCategoryData('test'),
              child: Catogaryscreen(
                tableName: 'test',
              ), // Make sure to provide a child widget
              // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'السندويتشات ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => FoodCubit()..fetchCategoryData('test'),
              child: Catogaryscreen(
                tableName: 'test',
              ), // Make sure to provide a child widget

              // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/pizza.png',
      'name': 'البيتزا ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => FoodCubit()..fetchCategoryData('test'),
              child: Catogaryscreen(
                tableName: 'test',
              ), // Make sure to provide a child widget
// اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/burger.png',
      'name': 'البرجر ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => FoodCubit()..fetchCategoryData('test'),
              child: Catogaryscreen(
                tableName: 'test',
              ), // Make sure to provide a child widget
              // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/salad.png',
      'name': 'السلطات',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => FoodCubit()..fetchCategoryData('test'),
              child: Catogaryscreen(
                tableName: 'test',
              ), // Make sure to provide a child widget
// اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/panna-cotta.png',
      'name': 'الحلويات ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => FoodCubit()..fetchCategoryData('test'),
              child: Catogaryscreen(
                tableName: 'test',
              ), // Make sure to provide a child widget
              // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/cold-drink.png',
      'name': 'مشروبات بارده',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => FoodCubit()..fetchCategoryData('test'),
              child: Catogaryscreen(
                tableName: 'test',
              ), // Make sure to provide a child widget
              // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/hot-chocolate.png',
      'name': 'مشروبات ساخنه',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) => FoodCubit()..fetchCategoryData('test'),
              child: Catogaryscreen(
                tableName: 'test',
              ), // Make sure to provide a child widget
              // اسم الجدول
              // child: const MedicalScreen(tableName: 'test'), // اسم الجدول
            ),
          ),
        );
      },
    },
  ];
  Future<void> fetchCategoryData(String tableName) async {
    try {
      emit(CategoryLoadingState());

      final response = await Supabase.instance.client
          .from(tableName)
          .select('name, price, image_url,ingredients,time,number');

      if (response == null || response.isEmpty) {
        emit(CategoryError('No data found for table "$tableName".'));
        return;
      }

      final List<Category> categories = (response  as List)
          .map((item) => Category(
                name: item['name'] ?? 'No Name',
                price: item['price'] ?? 'No price',
                imageUrl: item['image_url'] ?? '',
                ingredients: item['ingredients'] ?? '',
                time: item['time'] ?? '',
                number: item['number'] ?? '',
              ))
          .toList();
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
