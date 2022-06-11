import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:flutter/material.dart';

class FavoriteBooksView extends StatefulWidget {
  const FavoriteBooksView({Key? key,this.title}) : super(key: key);
  final String? title;

  @override
  State<FavoriteBooksView> createState() => _FavoriteBooksViewState();
}

class _FavoriteBooksViewState extends State<FavoriteBooksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('a')),
    );
  }
}
