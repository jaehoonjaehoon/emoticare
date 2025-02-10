import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '로그인',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: true, // 뒤로 가기 버튼 활성화
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SNS 로그인 버튼
              _buildSNSButton(
                onPressed: () {
                  // Google 로그인 로직
                },
                color: Colors.white,
                textColor: Colors.black,
                borderColor: Colors.grey,
                text: 'Google로 시작하기',
                icon: Icons.g_mobiledata,
              ),
              SizedBox(height: 10),
              _buildSNSButton(
                onPressed: () {
                  // Facebook 로그인 로직
                },
                color: Colors.blue,
                textColor: Colors.white,
                text: 'Facebook으로 시작하기',
                icon: Icons.facebook,
              ),
              SizedBox(height: 10),
              _buildSNSButton(
                onPressed: () {
                  // 카카오 로그인 로직
                },
                color: Colors.yellow,
                textColor: Colors.black,
                text: '카카오로 시작하기',
                icon: Icons.chat_bubble,
              ),
              Divider(height: 40, thickness: 1.5),
              Text(
                '또는',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 10),

              // 이메일 입력
              TextField(
                decoration: InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // 비밀번호 입력
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // 로그인 상태 유지 체크박스
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  Text('로그인 상태 유지'),
                ],
              ),

              // 로그인 버튼
              ElevatedButton(
                onPressed: () {
                  // 로그인 로직
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  '로그인',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              // 회원가입 및 기타 옵션
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      // 회원가입 로직
                    },
                    child: Text('회원가입', style: TextStyle(color: Colors.teal)),
                  ),
                  TextButton(
                    onPressed: () {
                      // 비밀번호 찾기 로직
                    },
                    child: Text('아이디 · 비밀번호 찾기',
                        style: TextStyle(color: Colors.teal)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 150, // 애드몹 광고 공간의 높이를 100으로 조정
        color: Colors.grey[200],
        child: Center(
          child: Text(
            '애드몹 광고 공간',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }

  // SNS 로그인 버튼 생성 위젯
  Widget _buildSNSButton({
    required VoidCallback onPressed,
    required Color color,
    required Color textColor,
    Color? borderColor,
    required String text,
    required IconData icon,
  }) {
    return SizedBox(
      width: double.infinity, // 버튼의 너비를 부모의 너비로 설정
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: borderColor != null ? BorderSide(color: borderColor) : null,
          padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이 조정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: Icon(icon, color: textColor),
        label: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
