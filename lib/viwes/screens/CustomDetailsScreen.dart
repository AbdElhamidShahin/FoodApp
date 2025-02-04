
import 'package:flutter/material.dart';

import '../../model/cubit/item.dart';
import '../../view_model/commpnas/color.dart';

class CustomDetailsScreen extends StatelessWidget {
  final Item item;
  String text = '';
  CustomDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
            height: 450,
            width: double.infinity,
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 0),
            child: Container(
              height: 120,
              constraints: const BoxConstraints(
                minHeight: 120,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              item.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 1/5 for Image (using FractionallySizedBox to scale image)
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FractionallySizedBox(
                        alignment: Alignment.center,
                        heightFactor: 0.99,
                        widthFactor:
                            1.2, // Ensures the image takes the full height
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            item.imageUrl, // Use the passed imageUrl here
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 1/5 Empty Space (Adjustable if needed)
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Text(
              "الوصف",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),

          Container(
            height: 210,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              child: Column(
                children: [
                  Text(
                    'تابعونا علي ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 18),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 160,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32), color: colorA),
              child: const Center(
                  child: Text(
                'تقييم',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              )),
            ),
          ),
        ]),
      ),
    );
  }
}
