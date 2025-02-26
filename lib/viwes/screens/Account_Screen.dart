import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  final Function(bool) toggleTheme;

  const AccountScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Mode Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Switch(
              value: isDarkMode,
              onChanged: toggleTheme,
            ),
            Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
          ],
        ),
      ),
    );
  }
}
