import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/item.dart'; // Import your custom Category class
import 'package:food_app/view_model/commpnas/color.dart';

class CustomItemCategory extends StatelessWidget {
  const CustomItemCategory({
    super.key,
    this.screenWidth,
    required this.imageUrl,
    required this.name,
    this.item,
    this.screenHeight,
  });

  final Item? item;
  final double? screenWidth;
  final double? screenHeight;
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth! * 0.06,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 16),
                              ),
                              Center(
                                child: Text(
                                  '  5.0',
                                  style: TextStyle(
                                    color: colorA,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
