import 'package:flutter/material.dart';

class DetailBookView extends StatefulWidget {
  const DetailBookView({Key? key,this.title}) : super(key: key);
  final String? title;


  @override
  State<DetailBookView> createState() => _DetailBookViewState();
}

class _DetailBookViewState extends State<DetailBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('b1'),
    );
  }
}
