import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int count = 1;
Widget buildNumber(int count, double horizontal, double vertical, double fontSize) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    decoration: BoxDecoration(
      color: Colors.red.shade900,
      shape: BoxShape.circle,
    ),
    child: Text(
      "$count",
      style: TextStyle(
          fontSize: fontSize, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildButton(String text, double horizontal, double vertical, double fontSize, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(20),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}