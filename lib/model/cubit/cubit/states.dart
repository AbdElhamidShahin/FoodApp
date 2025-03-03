import 'package:food_app/model/cubit/item.dart';

abstract class FoodState {}

class TravelInitialState extends FoodState {}

class TravelBottomnavBarState extends FoodState {}

class CategoryLoadingState extends FoodState {}

class CategorySuccess extends FoodState {
  final List<Item> items;

  CategorySuccess({required this.items});
}

class CategoryLoaded extends FoodState {
  final List<Item> items;
  final String tableName;
  final String uniqueId;

  CategoryLoaded(this.items, this.tableName, {required this.uniqueId});
}

class CategoryError extends FoodState {
  final String message;

  CategoryError(this.message);
}

class updateFavoriteState extends FoodState {
  final bool isFavorite;
  updateFavoriteState(this.isFavorite);
}

class FoodCountState extends FoodState {
  final int count;
  FoodCountState(this.count);
}

class CategoryInitial extends FoodState {}
