import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/product/constant/k_items.dart';
import 'package:destech_study_case/product/widget/body_list_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBookView extends StatefulWidget {
  const DetailBookView({Key? key}) : super(key: key);


  @override
  State<DetailBookView> createState() => _DetailBookViewState();
}

class _DetailBookViewState extends State<DetailBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FakeApiCubit,FakeApiState>(
        builder: (context,state){
          return ListView.builder(
            itemCount: state.favBooks?.length ?? kZero.toInt(),
              itemBuilder: (BuildContext context,int index) =>
                  Column(
                    children: [
                      Card(
                        child: BodyListCardWidget(model: state.favBooks?[index]),
                      ),
                    ],
                  )
          );
        },
      ),
    );
  }
}
