import 'package:flutter/material.dart';

import '../../view_model/commpnas/color.dart';

class Customrowhome extends StatelessWidget {
  const Customrowhome({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 11),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorBasic,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "شاهد المزيد",
                style: TextStyle(
                    color: colorA,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Spacer(),
          Text(
            text,
            style: TextStyle(
                color: colorA, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
