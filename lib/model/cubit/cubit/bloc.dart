import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/cubit/states.dart';
import 'package:food_app/viwes/screens/Account_Screen.dart';
import 'package:food_app/viwes/screens/cardScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_app/model/cubit/item.dart';
import '../../../viwes/screens/CatogaryScreen.dart';
import '../../../viwes/screens/Favorite_Screen.dart';
import '../../../viwes/screens/Home_Layout.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super((TravelInitialState()));

  static FoodCubit get(context) => BlocProvider.of<FoodCubit>(context);

  int currentIndex = 2;
  Widget currentScreen = HomeLayout();

  List<Widget> bottomScreens = [
    Favorite(),
    Cardscreen(
      items: [],
    ),
    HomeLayout(),
    AccountScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    currentScreen = bottomScreens[index];
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
                text: 'الوجبات',
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
                text: 'السلطات',
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
                text: 'البيتزا',
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
                text: 'البرجر',
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
                text: 'الحلويات',
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
                text: 'السندويتشات',
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
                text: 'مشروبات بارده',
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
                text: 'مشروبات ساخنه',
              ),
            ),
          ),
        );
      },
    },
  ];

  Future<void> fetchCategoryData(String tableName, {String? uniqueId}) async {
    try {
      emit(CategoryLoadingState());

      final response = await Supabase.instance.client
          .from(tableName)
          .select('id, name, price, image_url, ingredients, time, number');

      if (response.isEmpty) {
        emit(CategoryError('No data found for table "$tableName".'));
        return;
      }

      final List<Item> items = response
          .map((item) => Item(
                id: item['id']?.toString() ?? '0',
                name: item['name'] ?? 'No Name',
                price: item['price']?.toString() ?? '0',
                imageUrl: item['image_url'] ?? '',
                ingredients: item['ingredients'] ?? 'No Ingredients',
                time: item['time']?.toString() ?? 'Unknown',
                number: item['number']?.toString() ?? '0',
              ))
          .toList();

      emit(CategoryLoaded(items, tableName, uniqueId: uniqueId ?? 'default'));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  void getCategories() {
    emit(CategoryLoadingState());
    try {
      List<Item> items = [];
      emit(CategorySuccess(items: items));
    } catch (e) {
      emit(CategoryError("حدث خطأ أثناء تحميل الفئات"));
    }
  }

  bool isFavorite = true;
  void updateFavorite(bool isFavorite) {
    this.isFavorite = isFavorite;
    emit(updateFavoriteState(isFavorite));
  }

  void increment() {
    if (state is FoodCountState) {
      final currentState = state as FoodCountState;
      emit(FoodCountState(currentState.count + 1));
    }
  }

  void decrement() {
    if (state is FoodCountState) {
      final currentState = state as FoodCountState;
      if (currentState.count > 1) {
        emit(FoodCountState(currentState.count - 1));
      }
    }
  }
}
