import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_search_app/business_logic/cubits/search_word_cubit.dart';
import 'package:test_search_app/presentation/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<SearchWordCubit>(
        create: (_) => SearchWordCubit(),
        child: MainPage(title: 'Flutter test search'),
      ),
    );
  }
}
