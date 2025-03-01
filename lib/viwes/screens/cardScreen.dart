import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
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
          itemCard.items.isEmpty
              ? const Center(
                  child: Text(
                    'السلة فارغة!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: itemCard.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = itemCard.items[index];
                      final quantity = itemCard.getQuantity(item); // جلب الكمية
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
                            child:
                                Customcarditem(item: item, quantity: quantity),
                          );
                        },
                      );
                    },
                  ),
                ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          "${itemCard.getTotalPrice().toStringAsFixed(0)}EGP",
                          style: const TextStyle(
                            fontSize: 22,
                            color: colorB,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      ": المجموع",
                      style: TextStyle(
                        fontSize: 28,
                        color: colorA,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorB,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم اضافة العناصر الى الطلب!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Center(
                    child: Text(
                      "اتمام الطلب",
                      style: TextStyle(
                        color: colorA,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
