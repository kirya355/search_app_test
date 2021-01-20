import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_search_app/business_logic/cubits/search_word_cubit.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;
  final searchCubit = SearchWordCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60,
            margin: EdgeInsets.only(top: 8, left: 8, right: 8),
            child: TextField(
              onChanged: context.read<SearchWordCubit>().searchWord,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Builder(
            builder: (context) {
              final searchState = context.watch<SearchWordCubit>().state;
              if (searchState is SearchWordLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (searchState is SearchWordWithData) {
                if (searchState.data != null)
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Center(child: Text(searchState.data[index]));
                      },
                      itemCount: searchState.data.length,
                    ),
                  );
                else
                  return Text('Ready to Use');
              } else
                return Column(
                  children: [
                    Text('Error'),
                    IconButton(
                      icon: Icon(Icons.rotate_right,color: Theme.of(context).primaryColor,),
                      onPressed: context.read<SearchWordCubit>().initFetchData,
                    )
                  ],
                );
            },
          )
        ],
      ),
    );
  }
}
