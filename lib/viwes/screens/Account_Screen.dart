import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/viwes/screens/Favorite_Screen.dart';
import 'package:food_app/viwes/screens/Home%20LoginScreen.dart';
import 'package:food_app/viwes/screens/cardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String? name, phone, email;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      phone = prefs.getString('phone');
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
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorA,
                size: 24,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditAccunt()),
              );
            },
            icon: Icon(
              Icons.edit_note,
              color: colorA,
              size: 32,
            )),
        title: Center(
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
                      Text("${name} :الاسم",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colorA)),
                      SizedBox(
                        height: 6,
                      ),
                      Text("${phone} :رقم الهاتف",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colorA)),
                      SizedBox(
                        height: 6,
                      ),
                      Text("${email} :الايميل",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colorA)),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image(
                    width: 160,
                    height: 160,
                    image: NetworkImage(
                        'https://img.freepik.com/premium-vector/avatar-business-women-vector-illustration-flat-2_764382-57434.jpg'),
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

Padding CustomItemSetteings(String text, final VoidCallback? onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24, color: colorB),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Divider(
            color: Colors.black12,
          ),
        ),
      ],
    ),
  );
}
