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

          // Motivational Text Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              '힘이 되는 글귀 (매일 12시 변경)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // 상담 주제 카드
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
                      '상담 주제 ${index + 1}', // "상담 주제 1, 2, ..." 텍스트
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // BottomAppBar 섹션
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70, // 하단 네비게이션 바의 높이 설정
          decoration: BoxDecoration(
            color: Colors.white, // 배경색
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // 그림자
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconButton(Icons.menu, '전체메뉴', Colors.black),
              _buildIconButton(Icons.favorite, '찜', Colors.black),
              _buildIconButton(Icons.person, '내 프로필', Colors.black),
              _buildIconButton(Icons.chat, '상담 기록', Colors.black),
              _buildIconButton(Icons.settings, '설정', Colors.black),
            ],
          ),
        ),
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

  // Icon Button Builder with Color
  Widget _buildIconButton(IconData icon, String label, Color color) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: color), // 아이콘 크기 줄임
          SizedBox(height: 4), // 간격 조정
          Text(
            label,
            style: TextStyle(fontSize: 10, color: color), // 텍스트 크기 조정
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // 텍스트 길이 초과 시 생략 처리
          ),
        ],
      ),
    );
  }
}
