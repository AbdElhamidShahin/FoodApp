import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:food_app/model/cubit/cubit/states.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/helper/buildNumber.dart'; // Assumes buildButton and buildNumber are defined here.
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';
import 'package:food_app/viwes/wedget/customCardItem.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/commpnas/color.dart';

class Cardscreen extends StatelessWidget {
  final List<Item> items;

  const Cardscreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final itemCard = Provider.of<ItemCard>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Customappbar(
            text: 'السلة',
          ),
        ),
      ),
      body: Column(
        children: [
          // If there are no items show an empty message.
          itemCard.items.isEmpty
              ? const Center(
                  child: Text(
                    'السلة فارغة!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : Expanded(
                  // Wrap ListView.builder in Expanded to constrain its height.
                  child: ListView.builder(
                    itemCount: itemCard.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = itemCard.items[index];
                      return OpenContainer(
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedColor: Colors.transparent,
                        closedElevation: 0.0,
                        openElevation: 0.0,
                        transitionDuration: const Duration(milliseconds: 800),
                        openBuilder: (context, _) =>
                            CustomDetailsScreen(item: item),
                        closedBuilder: (context, openContainer) {
                          return GestureDetector(
                            onTap: openContainer,
                            child: Customcarditem(item: item),
                          );
                        },
                      );
                    },
                  ),
                ),
          // BlocBuilder to update the total price display.
          BlocBuilder<FoodCubit, FoodState>(
            builder: (context, state) {
              if (state is FoodCountState) {
                double totalPrice = 0;
                // Make sure your FoodCountState logic applies to each item correctly.
                for (var item in itemCard.items) {
                  totalPrice += double.parse(item.price) * state.count;
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        child: Text(
                          "${totalPrice.toStringAsFixed(0)}EGP",
                          style: const TextStyle(
                            fontSize: 22,
                            color: colorB,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      "المجموع",
                      style: TextStyle(
                        fontSize: 28,
                        color: colorA,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              } else {
                return Container(); // Fallback UI if state is not FoodCountState.
              }
            },
          ),
        ],
      ),
    );
  }
}
