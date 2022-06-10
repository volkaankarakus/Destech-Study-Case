import 'package:flutter/material.dart';

class FavoriteBooksView extends StatefulWidget {
  const FavoriteBooksView({Key? key}) : super(key: key);

  @override
  State<FavoriteBooksView> createState() => _FavoriteBooksViewState();
}

class _FavoriteBooksViewState extends State<FavoriteBooksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('a'),
      ),
    );
  }
}
