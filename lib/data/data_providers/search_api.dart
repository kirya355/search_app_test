import 'package:http/http.dart' as http;

class SearchApi {
  static const String _searchUrl = 'https://raw.githubusercontent.com/dwyl/english-words/master/words.txt';
  Future<http.Response> fetchData() async {
    return await http.get(_searchUrl);
  }
}
