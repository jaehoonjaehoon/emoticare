import 'package:flutter/material.dart';

void main() {
  runApp(EmotiCareApp());
}

class EmotiCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmotiCare',
      home: MainScreen(), // 앱 실행 시 첫 화면을 MainScreen으로 설정
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
