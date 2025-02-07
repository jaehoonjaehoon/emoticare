import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Logo', style: TextStyle(color: Colors.black, fontSize: 20)),
            Row(
              children: [
                Icon(Icons.search, color: Colors.black),
                SizedBox(width: 20),
                Icon(Icons.notifications, color: Colors.black),
                SizedBox(width: 20),
                Icon(Icons.shopping_cart, color: Colors.black),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tabs Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab('추천'),
                  _buildTab('학업'),
                  _buildTab('연애'),
                  _buildTab('이별'),
                  _buildTab('기타'),
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

            // Icon Buttons Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(Icons.menu, '전체메뉴'),
                  _buildIconButton(Icons.favorite, '찜'),
                  _buildIconButton(Icons.person, '내 프로필'),
                  _buildIconButton(Icons.chat, '상담 기록'),
                  _buildIconButton(Icons.settings, '설정'),
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

            // 상담 주제 카드
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              itemCount: 4, // 예시로 4개의 상담 주제를 추가
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: Center(
                    child: Text(
                      '상담 주제 ${index + 1}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '관심'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '등록'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: '상담'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MY'),
        ],
      ),
    );
  }

  // Tab Builder
  Widget _buildTab(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  // Icon Button Builder
  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
