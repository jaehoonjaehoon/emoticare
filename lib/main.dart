import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; // 메인 화면 가져오기

void main() {
  runApp(EmotiCareApp());
}

class EmotiCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmotiCare',
      theme: ThemeData(
        primarySwatch: Colors.blue, // 기본 테마 색상
      ),
      home: MainScreen(), // 앱 실행 시 메인 화면으로 이동
    );
  }
}
