import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) =>[
      IconButton(
          onPressed: (){
            if(query.isEmpty){
              close(context,null); //close searchbar
            }else {
              query = '';
            }
          },
          icon: Icon(Icons.clear))];

  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(
          onPressed: (){
            close(context, null); //close searchbar
          },
          icon: Icon(Icons.chevron_left));

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
  
}