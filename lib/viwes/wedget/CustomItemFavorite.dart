import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:provider/provider.dart';

class Customitemfavorite extends StatefulWidget {
  final Item item;

  const Customitemfavorite({
    super.key,
    required this.item,
  });

  @override
  State<Customitemfavorite> createState() => _CustomitemfavoriteState();
}

class _CustomitemfavoriteState extends State<Customitemfavorite> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = Provider.of<ItemProvider>(context, listen: false)
        .items
        .contains(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 180,
              decoration: BoxDecoration(
                color: colorBasic,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 2,
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 80, left: 8, right: 8, bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'name_${widget.item.name}',
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          widget.item.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: 'price_${widget.item.name}',
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              widget.item.price,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: colorBasic,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                    Provider.of<ItemProvider>(context,
                                            listen: false)
                                        .removeItem(widget.item);
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: 32,
                                  color: isFavorite ? Colors.red : Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -70,
              left: 20,
              height: 140,
              width: 140,
              child: Hero(
                tag: 'image_${widget.item.name}',
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(widget.item.imageUrl),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
