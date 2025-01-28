import 'package:flutter/material.dart';

import '../../view_model/commpnas/color.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Image(
                image: NetworkImage(
                    'https://img.freepik.com/premium-vector/avatar-business-women-vector-illustration-flat-2_764382-57434.jpg'),
                height: 50,
                width: 50,
              ),
              Spacer(),
              Text(
                "Happy Meal",
                style: TextStyle(
                    color: colorB, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 28,
                color: colorB,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: colorBasic, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.end, // وضع الأيقونة في أقصى اليسار

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search_outlined,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
