import 'package:flutter/material.dart';
import '../../view_model/commpnas/color.dart';

class Customcatogryitem extends StatelessWidget {
  final Map<String, dynamic> item;

  Customcatogryitem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item['onTap'] != null ? () => item['onTap'](context) : null,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorBasic,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(
                width: 45,
                height: 45,
                image: AssetImage(item['urlImage']),
              ),
            ),
          ),
          Text(
            item['name']!,
            style: TextStyle(
              color: colorA,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
