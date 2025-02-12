import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/Card_Screen.dart';
import '../../model/cubit/item.dart';
import '../../view_model/commpnas/helper/buildNumber.dart';
import '../wedget/buildFavoriteIcon.dart';

class CustomDetailsScreen extends StatefulWidget {
  final Item item;

  CustomDetailsScreen({super.key, required this.item});

  @override
  State<CustomDetailsScreen> createState() => _CustomDetailsScreenState();
}

class _CustomDetailsScreenState extends State<CustomDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(42, 45, 52, 1),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 460,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(16)),
                child: Image.network(
                  widget.item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/imagesFood/download.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 250,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: colorBasic,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            "${(double.parse(widget.item.price)).toStringAsFixed(0)}EGP",
                            style: TextStyle(
                              fontSize: 26,
                              color: colorA,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            widget.item.name,
                            style: const TextStyle(
                              fontSize: 28,
                              color: colorA,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "المكونات",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "مده الطهي:${widget.item.time}دقيقه",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.item.number}",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade700,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
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
                                buildButton("-", () {
                                  if (count > 1) {
                                    setState(() {
                                      count--;
                                    });
                                  }
                                }),
                                buildNumber(count),
                                buildButton("+", () {
                                  setState(() {
                                    count++;
                                  });
                                }),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "الكميه",
                            style: const TextStyle(
                              fontSize: 28,
                              color: colorA,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "الاضافات",
                      style: const TextStyle(
                        fontSize: 28,
                        color: colorA,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            child: Text(
                              "${(double.parse(widget.item.price) * count).toStringAsFixed(0)}EGP",
                              style: const TextStyle(
                                fontSize: 22,
                                color: colorB,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "المجموع",
                          style: const TextStyle(
                            fontSize: 28,
                            color: colorA,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorB,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        BuildFavoriteIcon(
                          item: widget.item,
                        );
                      },
                      child: const Center(
                        child: Text(
                          "اضافه الي السله",
                          style: TextStyle(
                            color: colorA,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: colorB,
                        size: 32,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  BuildFavoriteIcon(
                    item: widget.item,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
