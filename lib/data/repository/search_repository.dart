import 'package:test_search_app/data/data_providers/search_api.dart';
import 'package:http/http.dart' show Response;

class SearchRepository {
  List<String> _searchList;
  List<String> get searchList => _searchList;
  Future<List<String>> searchData() async {
    if (_searchList != null) {
      return _searchList;
    } else {
      final SearchApi _searchApi = SearchApi();
      try {
        Response response = await _searchApi.fetchData();
        if (response.statusCode == 200) {
          _searchList = response.body.split('\n');
          return _searchList;
        } else
          throw Exception('Response error: ${response.body}');
      } catch (_) {
        throw Exception('Can\'t fetch search Data');
      }
    }
  }
}
