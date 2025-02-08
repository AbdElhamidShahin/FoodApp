import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';

class CustomItemCategory extends StatelessWidget {
  const CustomItemCategory({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.item,
    required this.number,
    required this.time, required this.ingredients,
  });

  final String name;
  final String imageUrl;
  final String price;
  final String number;
  final String time;
  final String ingredients;

  final Item? item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CustomDetailsScreen(
              item: Item(
                ingredients:ingredients,
                number: number,
                name: name,
                price: price,
                imageUrl: imageUrl,
                time: time,
              ),
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
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
                      top: 80, left: 8, right: 8, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite_border,
                                size: 28, color: Colors.red),
                            onPressed: () {},
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
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
