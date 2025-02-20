import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';
import 'package:food_app/viwes/wedget/customCardItem.dart';
import 'package:provider/provider.dart';
class Cardscreen extends StatelessWidget {
  final List<Item> items;

  const Cardscreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final itemCard = Provider.of<ItemCard>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Customappbar(
            text: 'السلة',
          ),
        ),
      ),
      body: itemCard.items.isEmpty
          ? Center(
        child: Text(
          'السلة فارغة!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: itemCard.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = itemCard.items[index];

          return OpenContainer(
            transitionType: ContainerTransitionType.fadeThrough,
            closedColor: Colors.transparent,
            closedElevation: 0.0,
            openElevation: 0.0,
            transitionDuration: const Duration(milliseconds: 800),
            openBuilder: (context, _) => CustomDetailsScreen(item: item),
            closedBuilder: (context, openContainer) {
              return GestureDetector(
                onTap: openContainer,
                child: Customcarditem(item: item),
              );
            },
          );
        },
      ),
    );
  }
}