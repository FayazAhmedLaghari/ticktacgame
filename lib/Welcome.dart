import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tictoetack_game/HomeScreen.dart';
class Welcome extends StatefulWidget {
  const Welcome({super.key});
  @override
  State<Welcome> createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> {
@override
  void initState() {
    super.initState();
    Timer(Duration(seconds:3),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>HomeScreen()),
      );
    }
    );
}
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome  TIC TAC TOE Game',style: TextStyle(fontSize: 20,color: Colors.pink),)
          ],
        ),
      ),
    );
  }
}
