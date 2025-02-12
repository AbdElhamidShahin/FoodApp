import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:food_app/model/cubit/cubit/states.dart';
import 'package:food_app/model/cubit/item.dart' show Item, ItemProvider;
import 'package:provider/provider.dart';

import '../../model/cubit/ItemProvider.dart';
import '../../view_model/commpnas/color.dart';

class BuildFavoriteIcon extends StatefulWidget {
  final Item item;
  Color? color;
   BuildFavoriteIcon({Key? key, required this.item}) : super(key: key);

  @override
  State<BuildFavoriteIcon> createState() => _BuildFavoriteIconState();
}

class _BuildFavoriteIconState extends State<BuildFavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit, FoodState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = FoodCubit.get(context);
        bool isFavorite = cubit.isFavorite;

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: colorBasic,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  if (widget.item != null) {
                    Provider.of<ItemProvider>(context, listen: false)
                        .addItem(widget.item);

                    cubit.updateFavorite(!isFavorite);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  size: 32,
                  color: isFavorite ? Colors.red : Colors.red,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
