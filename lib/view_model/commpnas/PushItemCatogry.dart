import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/cubit/bloc.dart';
import '../../model/cubit/states.dart';
import '../../viwes/wedget/CustomCatogryItem.dart';

class Pushitemcatogry extends StatelessWidget {
  const Pushitemcatogry({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit, FoodState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = FoodCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      ": خدمات طبيه",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: cubit.items.map((item) {
                        return Customcatogryitem(item: item);
                      }).toList(),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}