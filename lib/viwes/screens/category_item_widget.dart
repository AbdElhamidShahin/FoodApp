import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:food_app/model/cubit/cubit/states.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';
import 'package:food_app/viwes/wedget/buildFavoriteIcon.dart';

class CategoryItemWidget extends StatefulWidget {
  CategoryItemWidget({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
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
              openBuilder: (context, _) =>
                  CustomDetailsScreen(item: widget.item),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Hero(
                                        tag: 'price_${widget.item.name}',
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Text(
                                            '${widget.item.price}EGP',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      BuildFavoriteIcon(item: widget.item),
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
                                backgroundImage:
                                    NetworkImage(widget.item.imageUrl),
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
