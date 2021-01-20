part of 'search_word_cubit.dart';

@immutable
abstract class SearchWordState {}

class SearchWordWithData extends SearchWordState {
  final List<String> data;
  SearchWordWithData(this.data);
}

class SearchWordLoading extends SearchWordState {}

class SearchWordError extends SearchWordState {}
