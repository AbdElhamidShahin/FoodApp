import 'package:flutter/material.dart';

import '../../view_model/commpnas/color.dart';

class Customtextfeild extends StatelessWidget {
  Customtextfeild({
    super.key,
    required this.hintText,
    this.onChanged,
    this.validator,
    this.controller,
  });

  final String hintText;
  Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: colorA,
              fontSize: 20.0,
            ),
            decoration: InputDecoration(
                filled: true,
                fillColor: colorBasic,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: colorA, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorA, width: 2.0),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: colorA, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
