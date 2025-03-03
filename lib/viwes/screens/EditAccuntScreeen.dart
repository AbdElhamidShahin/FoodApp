import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/view_model/commpnas/helper/LocalStorageAccount.dart';
import 'package:food_app/viwes/screens/Account_Screen.dart';
import 'package:food_app/viwes/wedget/CustomButton.dart';
import 'package:food_app/viwes/wedget/Customtextfeild.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("حدث خطأ أثناء اختيار الصورة: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: colorA,
              size: 24,
            ),
          ),
        ],
        title: const Center(
          child: Text(
            'تعديل الحساب',
            style: TextStyle(color: colorA, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      color: colorBasic,
                      borderRadius: BorderRadius.circular(100),
                      image: _imageFile != null
                          ? DecorationImage(
                              image: FileImage(_imageFile!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _imageFile == null
                        ? Center(
                            child: Image(
                              height: 130,
                              width: 130,
                              image: AssetImage(
                                  'assets/LoginImage/Camira-removebg-preview.png'),
                            ),
                          )
                        : null,
                  ),
                ),
                SizedBox(height: 28),
                Customtextfeild(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الاسم';
                    }
                    return null;
                  },
                  hintText: 'اسم المستخدم',
                ),
                Customtextfeild(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الايميل';
                    }
                    return null;
                  },
                  hintText: 'الايميل',
                ),
                Customtextfeild(
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال رقم الهاتف';
                    }
                    return null;
                  },
                  hintText: 'رقم الهاتف',
                ),
                const SizedBox(height: 100),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: CustomButton(
                    color: colorB,
                    color2: colorA,
                    text: 'حفظ التعديلات',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await UserDataManager.saveUserData(
                          name: _nameController.text,
                          phone: _phoneController.text,
                          email: _emailController.text,
                          imagePath: _imageFile?.path,
                        );
                        Navigator.pop(context, true);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
