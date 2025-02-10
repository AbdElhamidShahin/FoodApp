import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int count = 1;

Widget buildNumber(int count) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.red.shade900,
      shape: BoxShape.circle,
    ),
    child: Text(
      "$count",
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildButton(String text, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(20),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
