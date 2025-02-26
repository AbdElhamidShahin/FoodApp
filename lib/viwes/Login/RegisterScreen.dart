import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/helper/showCustomSnackbar.dart';
import 'package:food_app/viwes/Login/LoginScreen.dart';
import 'package:food_app/viwes/screens/Home%20LoginScreen.dart';
import 'package:food_app/viwes/screens/Home_Page.dart';
import 'package:food_app/viwes/wedget/CustomButton.dart';
import 'package:food_app/viwes/wedget/Customtextfeild.dart';

import '../../view_model/commpnas/color.dart';

class Registerscreen extends StatelessWidget {
  String? email, password;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    const emailRegex = "@gmail.com";

    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home_loginscreen()),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: colorA,
                  size: 28,
                )),
          ],
          title: Center(
              child: Text(
            '       حساب جديد',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: colorA, fontSize: 24),
          )),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          height: 250,
                          width: 250,
                          image: AssetImage(
                              'assets/LoginImage/snapedit_1740562356043-removebg-preview.png')),
                      const SizedBox(height: 20),
                      Customtextfeild(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else if (value.length < 6) {
                            return 'Must be at least 6 chars';
                          }

                          return null;
                        },
                        hintText: 'اسم المستخدم',
                        onChanged: (data) => email = data,
                      ),
                      Customtextfeild(
                        validator: (value) {
                          if (RegExp(emailRegex).hasMatch(value!)) {
                          } else if (value.isEmpty) {
                            return "@gmail.com";
                          } else {
                            return "@gmail.com";
                          }
                          return null;
                        },
                        hintText: 'Email',
                        onChanged: (data) => email = data,
                      ),
                      Customtextfeild(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          } else if (value.length < 6) {
                            return 'Must be at least 6 chars';
                          }

                          return null;
                        },
                        hintText: 'PassWord',
                        onChanged: (data) {
                          password = data;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: CustomButton(
                          color: colorB,
                          color2: colorA,
                          text: 'أنشئ حساب جديد',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                UserCredential user = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: email!, password: password!);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );

                                showCustomSnackbar(
                                    context,
                                    ContentType.success,
                                    'Registration successful',
                                    'Redirecting now');

                                await Future.delayed(Duration(seconds: 2));

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Loginscreen(),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  showCustomSnackbar(
                                      context,
                                      ContentType.failure,
                                      'Error',
                                      'Weak password');
                                } else if (e.code == 'email-already-in-use') {
                                  showCustomSnackbar(
                                      context,
                                      ContentType.failure,
                                      'Error',
                                      'Email already in use');
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerscreen()),
                              );
                            },
                            child: Text(
                              'تسجيل دخول',
                              style: TextStyle(color: colorA, fontSize: 22),
                            ),
                          ),
                          Text(
                            'هل لديك حساب؟',
                            style: TextStyle(color: colorA, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
