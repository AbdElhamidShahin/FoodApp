import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/helper/LocalStorageAccount.dart';
import 'package:food_app/viwes/screens/EditAccuntScreeen.dart';
import 'package:food_app/viwes/screens/Favorite_Screen.dart';
import 'package:food_app/viwes/screens/Home%20LoginScreen.dart';
import 'package:food_app/viwes/screens/cardScreen.dart';
import 'package:food_app/viwes/wedget/CustomItemSetteings.dart';
import 'package:provider/provider.dart';
import '../../view_model/commpnas/color.dart';
import '../../view_model/commpnas/helper/ThemeProvider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    super.key,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}
class _AccountScreenState extends State<AccountScreen> {
  String? name, phone, email, image;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    Map<String, String?> userData = await UserDataManager.loadUserData();
    setState(() {
      name = userData['name'];
      email = userData['email'];
      phone = userData['phone'];
      image = userData['imagePath'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorA,
                size: 24,
              ))
        ],
        leading: IconButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditAccountScreen()),
              );
              if (result == true) {
                await loadUserData();
              }
            },
            icon: const Icon(
              Icons.edit_note,
              color: colorA,
              size: 32,
            )),
        title: const Center(
            child: Text(
              'حسابي',
              style: TextStyle(color: colorA, fontWeight: FontWeight.bold),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${name ?? 'غير محدد'} :الاسم",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colorA)),
                      const SizedBox(
                        height: 6,
                      ),
                      Text("${phone ?? 'غير محدد'} :رقم الهاتف",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colorA)),
                      const SizedBox(
                        height: 6,
                      ),
                      Text("${email ?? 'غير محدد'} :الايميل",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colorA)),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: image != null && File(image!).existsSync()
                      ? Image.file(
                    File(image!),
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    'https://img.freepik.com/premium-vector/avatar-business-women-vector-illustration-flat-2_764382-57434.jpg',
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            CustomItemSetteings('الطلبات', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cardscreen(
                      items: [],
                    )),
              );
            }),
            CustomItemSetteings('العناوين', () {}),
            CustomItemSetteings('المفضله', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favorite()),
              );
            }),
            CustomItemSetteings('الاشعارات', () {}),
            CustomItemSetteings('اللغات', () {}),
            CustomItemSetteings('تغيير كلمه المرور', () {}),
            CustomItemSetteings('تسجيل الخروج', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home_loginscreen()),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      isDarkMode ? 'Dark Mode' : 'Light Mode',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: colorB),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: colorB, borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}