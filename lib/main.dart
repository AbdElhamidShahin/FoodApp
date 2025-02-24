import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/model/cubit/cubit/bloc.dart';
import 'package:food_app/viwes/screens/Account_Screen.dart';
import 'package:food_app/viwes/screens/Home_Page.dart';
import 'package:food_app/viwes/wedget/HH.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: BlocProvider<FoodCubit>(
        create: (context) => FoodCubit()..getCategories(),
        child: MyApp(), // Main app widget
      ),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: _themeMode, // Use the selected theme mode
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/account': (context) => AccountScreen(toggleTheme: _toggleTheme),
      },
    );
  }
}