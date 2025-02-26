import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/view_model/commpnas/helper/showCustomSnackbar.dart';
import 'package:food_app/viwes/Login/RegisterScreen.dart';
import 'package:food_app/viwes/screens/Home%20LoginScreen.dart';
import 'package:food_app/viwes/screens/Home_Page.dart';
import 'package:food_app/viwes/wedget/CustomButton.dart';
import 'package:food_app/viwes/wedget/Customtextfeild.dart';

class Loginscreen extends StatelessWidget {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';

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
            '       تسجيل الدخول',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: colorA, fontSize: 24),
          )),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
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
                        return 'Please enter your email';
                      } else if (!RegExp(emailRegex).hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    hintText: 'الايميل ',
                    onChanged: (data) => email = data,
                  ),
                  Customtextfeild(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    hintText: 'كلمه المرور',
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'هل نسيت كلمه المرور؟',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorA,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: CustomButton(
                      color: colorB,
                      color2: colorA,
                      text: 'تسجيل الدخول ',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            UserCredential user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email!, password: password!);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );

                            showCustomSnackbar(
                              context,
                              ContentType.success,
                              'Login successful',
                              'Redirecting to HomePage',
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'wrong-password') {
                              // في حال كانت كلمة المرور خاطئة
                              showCustomSnackbar(context, ContentType.failure,
                                  'Error', 'wrong password');
                            } else {
                              // معالجة باقي الأخطاء
                              showCustomSnackbar(context, ContentType.warning,
                                  'Error', 'No account? Sign up now');
                            }
                          } catch (ex) {
                            print(ex);
                            showCustomSnackbar(context, ContentType.failure,
                                'خطأ', 'حدث خطأ ما');
                          }
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 6),
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
                          'حساب جديد',
                          style: TextStyle(color: colorA, fontSize: 22),
                        ),
                      ),
                      Text(
                        'ليس لديك حساب؟',
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
      ),
    );
  }
}
