import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';
import 'package:food_app/viwes/screens/category_item_widget.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';
import '../../model/cubit/cubit/states.dart';
import '../../model/cubit/item.dart';

class Catogaryscreen extends StatelessWidget {
  final int? ItemCount;
  final String text;
  final Item? item;
  Catogaryscreen({
    Key? key,
    this.ItemCount,
    required this.text,
    this.item,
  }) : super(key: key);
  late bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Customappbar(
            text: text,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<FoodCubit, FoodState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoryLoaded) {
                  final Items = state.items;
                  var cubit = FoodCubit.get(context);

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                    ),
                    itemCount: Items.length,
                    itemBuilder: (context, index) {
                      return OpenContainer(
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedColor: Colors.transparent,
                        closedElevation: 0.0,
                        openElevation: 0.0,
                        transitionDuration: const Duration(milliseconds: 800),
                        openBuilder: (context, _) =>
                            CustomDetailsScreen(item: item!),
                        closedBuilder: (context, openContainer) {
                          return CategoryItemWidget(
                            item: Items[index],
                          );
                        },
                      );
                    },
                  );
                } else if (state is CategoryError) {
                  return Center(
                    child: Text('Error: ${state.message}'),
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
