import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/PushItemCatogry.dart';
import 'package:food_app/viwes/screens/CatogaryScreen.dart';
import 'package:food_app/viwes/screens/category_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:food_app/viwes/screens/Account_Screen.dart';
import 'package:food_app/viwes/screens/Home_Page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'viwes/screens/Home LoginScreen.dart';
import 'view_model/commpnas/helper/ThemeProvider.dart'; // Import ThemeProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
  await Supabase.initialize(
    url: 'https://msqkquddsfpmwwjylvms.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1zcWtxdWRkc2ZwbXd3anlsdm1zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgwNTczMTksImV4cCI6MjA1MzYzMzMxOX0.mXa-_leA4HeQZoyidPyEDSOyc-_8xXjsKXq3HplStC4',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => ItemCard()),

        ChangeNotifierProvider(
            create: (context) => ThemeProvider()), // Add ThemeProvider
      ],
      child: BlocProvider<FoodCubit>(
        create: (context) => FoodCubit()..getCategories(),
        child: MyApp(), // Main app widget
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
      ),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/account': (context) => AccountScreen(),
      },
    );
  }
}
