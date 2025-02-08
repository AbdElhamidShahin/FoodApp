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

class ItemProvider with ChangeNotifier {
  List<Item> _favorites = []; // Corrected type

  List<Item> get favorites => _favorites;

  ItemProvider() {
    _loadFavorites();
  }

  bool isFavorite(Item item) {
    return _favorites.contains(item);
  }

  void addToFavorites(Item item) async {
    if (!_favorites.contains(item)) {
      _favorites.add(item);
      await _saveFavorites();
      notifyListeners();
    }
  }

  void removeFromFavorites(Item item) async {
    _favorites.remove(item);
    await _saveFavorites();
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoriteList =
        _favorites.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList('favorites', favoriteList);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteList = prefs.getStringList('favorites');

    if (favoriteList != null) {
      _favorites =
          favoriteList.map((item) => Item.fromJson(jsonDecode(item))).toList();
      notifyListeners();
    }
  }
}
