import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRowWidget extends StatefulWidget {
  const SearchRowWidget({Key? key}) : super(key: key);

  @override
  State<SearchRowWidget> createState() => _SearchRowWidgetState();
}

class _SearchRowWidgetState extends State<SearchRowWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FakeApiCubit, FakeApiState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 250,
              child: TextField(
                textCapitalization: TextCapitalization.none,
                //default lowercase
                onChanged: (value) {
                  context.read<FakeApiCubit>().searchByTitle(value);
                },
                decoration: InputDecoration(
                    hintText: 'Search with title',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder()),
                style: TextStyle(fontSize: 15, height: 3),
              ),
            ),
            InkWell(onTap: () {
              context.read<FakeApiCubit>().getAll();
            }, child: Text('See all')),
            SizedBox.shrink()
          ],
        );
      },
    );
  }
}
