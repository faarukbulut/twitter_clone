import 'package:flutter/material.dart';
import 'package:twitter_clone/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
        tabBarTheme: const TabBarTheme(labelColor: Colors.blue, unselectedLabelColor: Colors.grey)
      ),
      
      home: const HomeView(),
    );
  }
}

