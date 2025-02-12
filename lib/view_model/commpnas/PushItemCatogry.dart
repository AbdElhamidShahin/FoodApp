import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/cubit/cubit/bloc.dart';
import '../../model/cubit/cubit/states.dart';
import '../../viwes/wedget/CustomCatogryItem.dart';

class Pushitemcatogry extends StatelessWidget {
  const Pushitemcatogry({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit, FoodState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = FoodCubit.get(context);
        var itemCount = cubit.items.take(4).toList(); //هستدعس 4 عناصر فقط

        return Row(
          children: itemCount.map((item) {
            return Expanded(
              child: Customcatogryitem(item: item),
            );
          }).toList(),
        );
      },
    );
  }
}
