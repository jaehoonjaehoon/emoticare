import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(EmotiCareApp());
}

class EmotiCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmotiCare',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 2초 후 메인 화면으로 이동
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경 색상
      body: Center(
        child: Image.asset('assets/logo.png', width: 200), // 로딩 이미지
      ),
    );
  }
}

// 메인 화면
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EmotiCare Main Screen")),
      body: Center(child: Text("Welcome to EmotiCare!")),
    );
  }
}
