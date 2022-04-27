import 'package:flutter/material.dart';
import 'package:tictactoegame/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe Game',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF00061a),
        shadowColor: const Color(0xFF001456),
        splashColor: const Color(0xFF4169e8),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
