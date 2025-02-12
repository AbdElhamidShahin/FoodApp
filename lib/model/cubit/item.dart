import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Item {
  final String name;
  final String price;
  final String imageUrl;
  final String? number;
  final String? time;
  final String? ingredients;

  Item({
    required this.number,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.time,
    required this.ingredients,
  });

  Map<String, dynamic> toJson() {
    return {
      'ingredients': ingredients,

      'time': time,
      'name': name,
      'price': price, // Changed from 'description' to 'price'
      'imageUrl': imageUrl,
      'number': number,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      ingredients: json['ingredients'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      number: json['number'],
      price: json['price'],
      time: json['time'],
    );
  }

  // Override equality to help with .contains
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          number == other.number; // use a unique identifier

  @override
  int get hashCode => number.hashCode;
}

