
import 'package:flutter/foundation.dart';

abstract class FoodState {

}

class TravelInitialState extends FoodState {}

class TravelBottomnavBarState extends FoodState {}

class CategoryLoadingState extends FoodState {}

class CategoryLoaded extends FoodState {
  final List<Category> categories;

  CategoryLoaded(this.categories);
}


class CategoryError extends FoodState {
  final String message;

  CategoryError(this.message);
}