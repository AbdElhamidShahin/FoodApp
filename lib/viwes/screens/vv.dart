import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/bloc.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/model/cubit/states.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';

class CustomItemCategory extends StatelessWidget {
  const CustomItemCategory({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit()..getCategories(),
      child: BlocConsumer<FoodCubit, FoodState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryError) {
            return const Center(child: Text('⚠ لا توجد عناصر متاحة الآن'));
          } else if (state is CategorySuccess) {
            return OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              closedColor: Colors.transparent,
              closedElevation: 0.0,
              openElevation: 0.0,
              transitionDuration: const Duration(milliseconds: 800),
              openBuilder: (context, _) => CustomDetailsScreen(item: item),
              closedBuilder: (context, openContainer) {
                return GestureDetector(
                  onTap: openContainer,
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
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
                                  Hero(
                                    tag: 'name_${item.name}',
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Hero(
                                        tag: 'price_${item.name}',
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Text(
                                            item.price,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Hero(
                                        tag: 'fav_${item.name}',
                                        child: IconButton(
                                          icon: const Icon(Icons.favorite_border,
                                              size: 28, color: Colors.red),
                                          onPressed: () {},
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
                              tag: 'image_${item.name}',
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: NetworkImage(item.imageUrl),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("⚠ تحقق من الاتصال بالإنترنت"));
          }

        },
        listener: (context, state) {},
      ),
    );
  }
}
