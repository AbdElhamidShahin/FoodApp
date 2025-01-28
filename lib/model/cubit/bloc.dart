import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/states.dart';
import 'package:food_app/viwes/screens/vv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../viwes/screens/Account_Screen.dart';
import '../../viwes/screens/Card_Screen.dart';
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
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'الصيداليات',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) =>
                  FoodCubit()..fetchCategoryData('test'), // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'المعامل ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) =>
                  FoodCubit()..fetchCategoryData('test'), // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'أطفال ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) =>
                  FoodCubit()..fetchCategoryData('test'), // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'أسنان ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) =>
                  FoodCubit()..fetchCategoryData('test'), // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'عظام ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) =>
                  FoodCubit()..fetchCategoryData('test'), // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'أشعه ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) =>
                  FoodCubit()..fetchCategoryData('test'), // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'جلديه ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) =>
                  FoodCubit()..fetchCategoryData('test'), // اسم الجدول
            ),
          ),
        );
      },
    },
    {
      'urlImage': 'assets/imageCatogry/sandwich.png',
      'name': 'قلب  ',
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (_) =>
                  FoodCubit()..fetchCategoryData('test'), // اسم الجدول
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

      final List<Category> categories = (response as List)
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
