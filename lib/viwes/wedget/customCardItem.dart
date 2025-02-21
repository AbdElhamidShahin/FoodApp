import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:provider/provider.dart';
import '../../view_model/commpnas/helper/buildNumber.dart'; // Contains buildButton and buildNumber.

class Customcarditem extends StatefulWidget {
  const Customcarditem({super.key, required this.item});
  final Item item;

  @override
  State<Customcarditem> createState() => _CustomcarditemState();
}

class _CustomcarditemState extends State<Customcarditem> {
  int count = 1; // Declare a local counter for this item.

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
                Provider.of<ItemCard>(context, listen: false)
                    .removeCard(widget.item);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 28,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.red.shade700,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildButton("-", 12, 10, 20, () {
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }
                  }),
                  buildNumber(count, 16, 10, 20),
                  buildButton("+", 12, 10, 20, () {
                    setState(() {
                      count++;
                    });
                  }),
                ],
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.item.name,
                  style: const TextStyle(
                      color: colorA, fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "${widget.item.price}EGP",
                  style: const TextStyle(
                      color: colorA, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: NetworkImage(widget.item.imageUrl),
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
