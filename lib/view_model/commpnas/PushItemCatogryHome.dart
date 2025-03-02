import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/viwes/wedget/CustomImageHome.dart';

import '../../model/cubit/cubit/bloc.dart';
import '../../model/cubit/cubit/states.dart';

class Pushitemcatogryhome extends StatelessWidget {
  final String tableName;
  const Pushitemcatogryhome({super.key, required this.tableName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<FoodCubit>(context)..fetchCategoryData(tableName),
      child: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryError) {
            return Center(child: Text(state.message));
          } else if (state is CategoryLoaded) {
            final items = state.items; // استخدام items بدلاً من Items
            if (items.isEmpty) {
              return const Center(child: Text('لا توجد عناصر متاحة'));
            }
            return SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomImageHome(item: item),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
