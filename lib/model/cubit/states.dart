
import 'package:flutter/foundation.dart';
import 'package:food_app/model/cubit/item.dart';

abstract class FoodState {

}

class TravelInitialState extends FoodState {}

class TravelBottomnavBarState extends FoodState {}

class CategoryLoadingState extends FoodState {}


class CategoryLoaded extends FoodState {
  final List<Item> Items;

  CategoryLoaded(this.Items);
}
class CategoryError extends FoodState {
  final String message;

  CategoryError(this.message);
}