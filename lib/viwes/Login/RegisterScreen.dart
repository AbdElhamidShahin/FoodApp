import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/helper/LocalStorageAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_app/view_model/commpnas/helper/showCustomSnackbar.dart';
import 'package:food_app/viwes/Login/LoginScreen.dart';
import 'package:food_app/viwes/screens/Home_Page.dart';
import 'package:food_app/viwes/wedget/CustomButton.dart';
import 'package:food_app/viwes/wedget/Customtextfeild.dart';
import '../../view_model/commpnas/color.dart';



class Registerscreen extends StatelessWidget {
  String? name, email, password, confirmPassword, phone;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    const emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorA,
                size: 28,
              ),
            ),
          ],
          title: Center(
            child: Text(
              '       حساب جديد',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorA,
                fontSize: 24,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/LoginImage/snapedit_1740562356043-removebg-preview.png',
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(height: 20),

                        // اسم المستخدم
                        Customtextfeild(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال اسم المستخدم';
                            }
                            return null;
                          },
                          hintText: 'اسم المستخدم',
                          onChanged: (data) => name = data,
                        ),

                        // البريد الإلكتروني
                        Customtextfeild(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال البريد الإلكتروني';
                            } else if (!RegExp(emailRegex).hasMatch(value)) {
                              return 'أدخل بريد إلكتروني صحيح';
                            }
                            return null;
                          },
                          hintText: 'البريد الإلكتروني',
                          onChanged: (data) => email = data,
                        ),

                        // رقم الهاتف
                        Customtextfeild(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال رقم الهاتف';
                            } else if (value.length < 10) {
                              return 'رقم الهاتف يجب أن يكون 10 أرقام على الأقل';
                            }
                            return null;
                          },
                          hintText: 'رقم الهاتف',
                          onChanged: (data) => phone = data,
                        ),

                        // كلمة المرور
                        Customtextfeild(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال كلمة المرور';
                            } else if (value.length < 6) {
                              return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                            }
                            return null;
                          },
                          hintText: 'كلمة المرور',
                          onChanged: (data) => password = data,
                        ),

                        // تأكيد كلمة المرور
                        Customtextfeild(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى تأكيد كلمة المرور';
                            } else if (value != password) {
                              return 'كلمتا المرور غير متطابقتين';
                            }
                            return null;
                          },
                          hintText: 'تأكيد كلمة المرور',
                          onChanged: (data) => confirmPassword = data,
                        ),

                        const SizedBox(height: 20),

                        // زر إنشاء الحساب
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
                                    email: email!,
                                    password: password!,
                                  );

                                  await saveUserLocally(name!, email!, phone!);

                                  showCustomSnackbar(
                                    context,
                                    ContentType.success,
                                    'تم التسجيل بنجاح',
                                    'سيتم تحويلك الآن الي صفحه تسجيل الدخول',
                                  );

                                  await Future.delayed(Duration(seconds: 2));

                                  Navigator.pushReplacement(
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
                                      'خطأ',
                                      'كلمة المرور ضعيفة جدًا',
                                    );
                                  } else if (e.code == 'email-already-in-use') {
                                    showCustomSnackbar(
                                      context,
                                      ContentType.failure,
                                      'خطأ',
                                      'البريد الإلكتروني مستخدم بالفعل',
                                    );
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
                            Text(
                              'هل لديك حساب؟',
                              style: TextStyle(color: colorA, fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Loginscreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'تسجيل دخول',
                                style: TextStyle(color: colorA, fontSize: 22),
                              ),
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
          ],
        ),
      ),
    );
  }
}
