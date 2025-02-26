import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/Login/LoginScreen.dart';
import 'package:food_app/viwes/wedget/CustomButton.dart';

import '../Login/RegisterScreen.dart';

class Home_loginscreen extends StatelessWidget {
  const Home_loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: Image(
                width: 380,
                height: 380,
                image: AssetImage(
                    'assets/LoginImage/snapedit_1740562356043-removebg-preview.png')),
          ),
          SizedBox(height: 120,),
          SizedBox(
            height: 55,
            width: double.infinity,
            child: CustomButton(
              text: 'تسجيل الدخول ',
              onTap: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Loginscreen()),
                );
              },
              color: colorB,
              color2: colorA,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 55,
            width: double.infinity,
            child: CustomButton(
              text: 'حساب جديد ',
              onTap: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Registerscreen()),
                );
              },
              color: Colors.white,
              color2: colorA,
            ),
          ),
        ],
      ),
    );
  }
}
