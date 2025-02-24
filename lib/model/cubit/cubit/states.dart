import 'package:food_app/model/cubit/item.dart';

abstract class FoodState {}

class TravelInitialState extends FoodState {}

class TravelBottomnavBarState extends FoodState {}

class CategoryLoadingState extends FoodState {}

class CategorySuccess extends FoodState {
  final List<Item> Items;

  CategorySuccess({required this.Items});
}

class CategoryLoaded extends FoodState {
  final List<Item> Items;

  CategoryLoaded(this.Items);
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


