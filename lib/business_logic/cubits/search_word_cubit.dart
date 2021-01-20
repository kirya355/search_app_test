import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_search_app/data/repository/search_repository.dart';

part 'search_word_state.dart';

class SearchWordCubit extends Cubit<SearchWordState> {
  final SearchRepository _repository = SearchRepository();
  SearchWordCubit() : super(SearchWordWithData(null)) {
    initFetchData();
  }

  Future<void> initFetchData() async {
    emit(SearchWordLoading());
    try {
      await _repository.searchData();
      return emit(SearchWordWithData(null));
    } catch (_) {
      return emit(SearchWordError());
    }
  }

  searchWord(String word) {
    List<String> _list = [];
    _repository.searchList.forEach((element) {
      if (element.startsWith(word)) _list.add(element);
    });
    return emit(SearchWordWithData(_list));
  }
}
