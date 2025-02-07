import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://your-server-url.com/api';

  Future<List<String>> fetchCounselingTopics() async {
    final response = await http.get(Uri.parse('$baseUrl/topics'));
    if (response.statusCode == 200) {
      // 서버에서 받은 데이터를 리스트로 변환
      return ['학업', '연애', '이별', '기타'];
    } else {
      throw Exception('Failed to load topics');
    }
  }
}
