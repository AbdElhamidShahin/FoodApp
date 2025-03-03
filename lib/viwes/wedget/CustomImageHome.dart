import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';

class CustomImageHome extends StatelessWidget {
  const CustomImageHome({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  child: Image.network(
                    item.imageUrl,
                    height: 160,
                    width: 234,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.name,
                style: TextStyle(
                  color: colorA,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
