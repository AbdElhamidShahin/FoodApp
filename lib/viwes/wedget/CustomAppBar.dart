import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/helper/LocalStorageAccount.dart';

import '../../view_model/commpnas/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customappbar extends StatefulWidget {
  const Customappbar({super.key, required this.text});
  final String text;

  @override
  State<Customappbar> createState() => _CustomappbarState();
}
class _CustomappbarState extends State<Customappbar> {
  String? image;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    Map<String, String?> userData = await UserDataManager.loadUserData();
    setState(() {
      image = userData['imagePath'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: image != null && File(image!).existsSync()
                      ? Image.file(
                    File(image!),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    'https://img.freepik.com/premium-vector/avatar-business-women-vector-illustration-flat-2_764382-57434.jpg',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Spacer(),
              Text(
                widget.text,
                style: TextStyle(
                    color: colorB, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 28,
                  color: colorB,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
          ),
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                color: colorBasic, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search_outlined,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}