import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/Favorite_Screen.dart';

import '../../model/cubit/item.dart';

class CustomDetailsScreen extends StatelessWidget {
  final Item item;

  CustomDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(42, 45, 52, 1),
      body: Stack(
        children: [
          // الصورة العلوية
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 460,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(16)),
              child: Image.network(
                item.imageUrl,
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

          // محتوى الوصف وزر "ابدأ الطهي"
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // زر "ابدأ الطهي"
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2F2D2F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  FavoriteScreen(), // الصفحة الفعلية
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var scaleAnimation = Tween<double>(
                              begin: 0.5,
                              end: 1.0,
                            ).animate(CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            ));
                            var fadeAnimation = Tween<double>(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            ));
                            return ScaleTransition(
                              scale: scaleAnimation,
                              child: FadeTransition(
                                opacity: fadeAnimation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "Start Cooking",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // زر الرجوع وزر المفضلة
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
                _buildFavoriteIcon(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteIcon(BuildContext context) {
    return Padding(
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
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              // هنا يمكنك إضافة منطق تغيير حالة المفضلة
              print("تم النقر على زر المفضلة");
            },
            icon: Icon(
              Icons
                  .favorite_border_outlined, // يمكنك استبداله بـ Icons.favorite إذا كان مفضلاً
              size: 30,
              color: colorA,
            ),
          ),
        ),
      ),
    );
  }
}
