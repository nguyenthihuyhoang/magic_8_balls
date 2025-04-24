import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Balls',
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade200),
      home: const MyHomePage(title: 'Magic 8 Balls'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _ballNumber = 1;
  double _opacity = 1.0;

  void _randomBallNumber() {
    setState(() {
      _opacity = 0;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _ballNumber = Random().nextInt(5) + 1;
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 100),
          child: TextButton(
            onPressed: _randomBallNumber,
            child: Image.asset('images/ball$_ballNumber.png'),
          ),
        ),
      ),
    );
  }
}
