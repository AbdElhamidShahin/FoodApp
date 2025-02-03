import 'package:flutter/material.dart';
import '../../view_model/commpnas/color.dart';

class Customcatogryitem extends StatelessWidget {
  final Map<String, dynamic> item;

  Customcatogryitem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item['onTap'] != null ? () => item['onTap'](context) : null,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorBasic,
              ),
              child: FittedBox(
                fit: BoxFit.contain, // التحكم في كيفية ملاءمة الصورة
                child: Image(
                  image: AssetImage(item['urlImage']),
                ),
              ),
            ),
            Text(
              item['name']!,
              style: TextStyle(
                  color: colorA, fontWeight: FontWeight.bold, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}