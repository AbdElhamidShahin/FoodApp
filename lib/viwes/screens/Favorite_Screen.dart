import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:food_app/model/cubit/cubit/states.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';
import 'package:food_app/viwes/screens/category_item_widget.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, itemProvider, child) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Customappbar(
                      text: 'My Favorite',
                    ))),
            body: itemProvider.items.isEmpty
                ? const Center(
                    child: Text(
                      'No favorite items',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : BlocConsumer<FoodCubit, FoodState>(
                    listener: (BuildContext context, state) {},
                    builder: (BuildContext context, state) {
                      var cubit = FoodCubit.get(context);
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .7,
                        ),
                        itemCount: itemProvider.items.length,
                        itemBuilder: (context, index) {
                          final item = itemProvider.items[index];

                          return GestureDetector(
                            onTap: () {},
                            child: CategoryItemWidget(
                              item: item,
                            ),
                          );
                        },
                      );
                    },
                  ));
      },
    );
  }
}
