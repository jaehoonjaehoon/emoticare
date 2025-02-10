import 'package:flutter/material.dart';
import 'login_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 현재 선택된 탭의 인덱스
  bool _isLoggedIn = false; // 로그인 여부 확인 변수

  // 탭 변경 시 호출되는 함수
  void _onItemTapped(int index) {
    if (index == 2 && !_isLoggedIn) {
      // My 탭 클릭 시 로그인이 되어 있지 않으면 로그인 페이지로 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index; // 선택된 인덱스 업데이트
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.png', // 로고 이미지 경로
              height: 40,
            ),
            Row(
              children: [
                Icon(Icons.search, color: Colors.black),
                SizedBox(width: 20),
                Icon(Icons.alarm, color: Colors.black),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Tabs Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTapButton(context, '사업'),
                _buildTapButton(context, '학업'),
                _buildTapButton(context, '연애'),
                _buildTapButton(context, '이별'),
                _buildTapButton(context, '기타'),
              ],
            ),
          ),

          // Ads Section
          Container(
            color: Colors.grey[200],
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.yellow[200],
                    child: Center(child: Text('애드센스 광고')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue[200],
                    child: Center(child: Text('배너 광고')),
                  ),
                ),
              ],
            ),
          ),

          // Motivational Text Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              '힘이 되는 글귀 (매일 12시 변경)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // 상담 주제 카드 (후기)
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2열
                mainAxisSpacing: 10, // 세로 간격
                crossAxisSpacing: 10, // 가로 간격
                childAspectRatio: 1.5, // 카드 비율
              ),
              itemCount: 4, // 카드 개수
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3, // 카드 그림자
                  child: Center(
                    child: Text(
                      '후기 ${index + 1}', // "후기 1, 2, ..." 텍스트
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // 현재 활성화된 탭의 인덱스
        onTap: _onItemTapped, // 탭 클릭 시 호출
        selectedItemColor: Colors.teal, // 활성화된 탭의 색상
        unselectedItemColor: Colors.black, // 비활성화된 탭의 색상
        type: BottomNavigationBarType.fixed, // 너비 고정
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.notes_sharp), label: '상담'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '상담 기록'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
    );
  }

  // 터치 가능한 탭 버튼 위젯
  Widget _buildTapButton(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label 버튼 클릭됨!')),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[300], // 탭 배경색
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
