import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:provider/provider.dart';

class Customcarditem extends StatelessWidget {
  const Customcarditem({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12, bottom: 28, top: 12),
      child: Container(
        decoration: BoxDecoration(
          color: colorBasic,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Provider.of<ItemCard>(context, listen: false).removeCard(item);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 28,
              ),
            ),
            Image(
              image: NetworkImage(item.imageUrl),
              width: 80,
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
