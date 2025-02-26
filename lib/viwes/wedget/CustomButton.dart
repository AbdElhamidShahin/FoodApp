import 'package:flutter/material.dart';

import '../../view_model/commpnas/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.onTap,
    required this.color,
    required this.color2,
  });

  final String? text;
  final VoidCallback? onTap;
  final Color color;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: color2),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text ?? '',
          style: TextStyle(
            color: colorA,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
