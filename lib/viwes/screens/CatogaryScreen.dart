import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/bloc.dart';
import 'package:food_app/model/cubit/states.dart';
import 'package:food_app/viwes/screens/vv.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';
import '../../model/cubit/item.dart';

class Catogaryscreen extends StatelessWidget {
  final int? ItemCount;
  final String text;
  const Catogaryscreen({
    Key? key,
    this.ItemCount,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // تحديد الارتفاع
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
                  final Items = state.Items;

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                    ),
                    itemCount: Items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: CustomItemCategory(
                          ingredients: Items[index].name,

                          name: Items[index].name,
                          imageUrl: Items[index].imageUrl,
                          price: Items[index].price,
                          number: Items[index].price,
                          time: Items[index].price,
                        ),
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
