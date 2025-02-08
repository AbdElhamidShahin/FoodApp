import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';

class Customimagehome extends StatelessWidget {
  const Customimagehome({super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
              child: Image.asset(
                height: 160,
                width: 234,
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
              color: colorA, fontSize: 22, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
