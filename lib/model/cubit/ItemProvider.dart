import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  ItemProvider() {
    _loadItems();
  }

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    _saveItems();
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    _saveItems();
    notifyListeners();
  }

  void _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(_items.map((item) => item.toJson()).toList());
    await prefs.setString('favorite_items', data);
  }

  void _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('favorite_items');
    if (data != null) {
      final List<dynamic> json = jsonDecode(data);
      _items = json.map((e) => Item.fromJson(e)).toList();
      notifyListeners();
    }
  }
}

class ItemCard with ChangeNotifier {
  List<Item> _items = [];

  ItemCard() {
    _loadCard();
  }

  List<Item> get items => _items;

  void addCard(Item item) {
    _items.add(item);
    _saveCard();
    notifyListeners();
  }

  void removeCard(Item item) {
    _items.remove(item);
    _saveCard();
    notifyListeners();
  }

  void _saveCard() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(_items.map((item) => item.toJson()).toList());
    await prefs.setString('Card_items', data);
  }

  void _loadCard() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('Card_items');
    if (data != null) {
      final List<dynamic> json = jsonDecode(data);
      _items = json.map((e) => Item.fromJson(e)).toList();
      notifyListeners();
    }
  }
}
