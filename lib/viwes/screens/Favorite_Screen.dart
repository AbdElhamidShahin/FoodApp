import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, itemProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'My Favorite ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: itemProvider.items.isEmpty
              ? const Center(
            child: Text(
              'No favorite items',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          )
              : ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final travel = itemProvider.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 8),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation,
                                  secondaryAnimation) =>
                                  CustomDetailsScreen(
                                    item: travel, // تم التعديل هنا
                                  ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var slideAnimation = Tween<Offset>(
                                  begin: const Offset(1.0, 0.5),
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeInOutExpo,
                                  ),
                                );

                                var rotationAnimation = Tween<double>(
                                    begin: -0.2, end: 0.0)
                                    .animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOutBack,
                                  ),
                                );

                                var scaleAnimation = Tween<double>(
                                    begin: 0.8, end: 1.0)
                                    .animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastOutSlowIn,
                                  ),
                                );

                                return Stack(
                                  children: [
                                    Positioned.fill(
                                      child: AnimatedBuilder(
                                        animation: animation,
                                        builder: (context, _) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              gradient: RadialGradient(
                                                colors: [
                                                  Colors.lightBlueAccent
                                                      .withOpacity(
                                                      animation
                                                          .value),
                                                  Colors.white
                                                      .withOpacity(1 -
                                                      animation
                                                          .value),
                                                ],
                                                radius: 2.5,
                                                center: Alignment(
                                                    animation.value - 0.1,
                                                    animation.value),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SlideTransition(
                                      position: slideAnimation,
                                      child: RotationTransition(
                                        turns: rotationAnimation,
                                        child: ScaleTransition(
                                          scale: scaleAnimation,
                                          child: child,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              transitionDuration:
                              const Duration(milliseconds: 1800),
                            ),
                          );
                        },

                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
