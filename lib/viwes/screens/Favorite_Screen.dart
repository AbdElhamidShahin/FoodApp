import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';
import 'package:food_app/viwes/wedget/CustomItemFavorite.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  final Item? item;

  Favorite({super.key, this.item});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Customappbar(
            text: 'My Favorite',
          ),
        ),
      ),
      body: itemProvider.items.isEmpty
          ? Center(
              child: Text(
                'No favorite items',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
              ),
              itemCount: itemProvider.items.length,
              itemBuilder: (context, index) {
                final item = itemProvider.items[index];

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
                        child: Customitemfavorite(
                          item: item,
                        ));
                  },
                );
              },
            ),
    );
  }
}
