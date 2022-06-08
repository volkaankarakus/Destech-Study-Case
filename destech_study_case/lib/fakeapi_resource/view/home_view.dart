import 'dart:developer';

import 'package:destech_study_case/fakeapi_resource/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
                child: Text(books[index].author ?? ''));
          }),

    );
  }
}
