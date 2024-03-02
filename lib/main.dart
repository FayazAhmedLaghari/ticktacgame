
import 'package:flutter/material.dart';
import 'package:tictoetack_game/Welcome.dart';
import 'HomeScreen.dart';
void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tictoetack game',
      home:Welcome(),
    );
  }
}
