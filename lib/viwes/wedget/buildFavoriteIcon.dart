import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/item.dart' show Item;
import 'package:provider/provider.dart';

import '../../model/cubit/ItemProvider.dart';
import '../../view_model/commpnas/color.dart';

class BuildFavoriteIcon extends StatefulWidget {
  final Item item; // تمرير العنصر من خلال المُنشئ

  const BuildFavoriteIcon({Key? key, required this.item}) : super(key: key);

  @override
  State<BuildFavoriteIcon> createState() => _BuildFavoriteIconState();
}

class _BuildFavoriteIconState extends State<BuildFavoriteIcon> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = false; // تعيين القيمة الافتراضية للمفضلة
  }

  @override
  Widget build(BuildContext context) {
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
              Provider.of<ItemProvider>(context, listen: false)
                  .addItem(widget.item);
              setState(() {
                isFavorite = !isFavorite; // تغيير الحالة عند الضغط
              });
            },
            icon:Icon(
    Icons.favorite_outlined,
    size: 26,
    color: isFavorite
    ? colorB
        : Colors.transparent,
    ),),
        ),
      ),
    );
  }
}
