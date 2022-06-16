import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/fakeapi_resource/view/home_view.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/product/constant/k_items.dart';
import 'package:destech_study_case/product/constant/padding_items.dart';
import 'package:destech_study_case/product/theme/light_theme.dart';
import 'package:destech_study_case/product/utility/utility_network_image.dart';
import 'package:destech_study_case/product/widget/body_list_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBookView extends StatefulWidget {
  DetailBookView({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailBookView> createState() => _DetailBookViewState();
}

class _DetailBookViewState extends State<DetailBookView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FakeApiCubit, FakeApiState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Card(
                child: Column(children: [
                  SizedBox(
                    height: 700,
                    child: Padding(
                      padding: PaddingItems.all(),
                      child: Column(children: [
                        Expanded(
                            child: CircleAvatar(
                              radius : 50,
                              backgroundColor: LightColor().russianViolet,
                              child: ClipOval(
                                child: UtilityNetworkImage.network(
                                  src : state.selectedBook?.image,
                                ),
                              ),
                            ),
                        ),
                        Padding(
                          padding: PaddingItems.topNormal(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _detailRow(context, state,'ID :','${state.selectedBook?.id}'),
                                _detailRow(context, state,'Title :','${state.selectedBook?.title}'),
                                _detailRow(context, state,'Author :','${state.selectedBook?.author}'),
                                _detailRow(context, state,'Genre :','${state.selectedBook?.genre}'),
                                _detailRow(context, state,'Description :','${state.selectedBook?.description}'),
                                _detailRow(context, state,'ISBN :','${state.selectedBook?.isbn}'),
                                _detailRow(context, state,'Published :','${state.selectedBook?.published}'),
                                _detailRow(context, state,'Publisher :','${state.selectedBook?.publisher}'),
                              ]),
                        ),
                      ]),
                    ),
                  )
                ]),
              ),
            ));
      },
    );
  }

  Widget _detailRow(BuildContext context, FakeApiState state,String text1,String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _boldText(context,text1)),
                                SizedBox(height: 10,),
                                Expanded(
                                    child: _descriptionText(state, context,text2)),
                                
                              ],
                            );
  }

  Widget _descriptionText(FakeApiState state, BuildContext context,String text) {
    return Text(text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                      color: LightColor().russianViolet,
                                      fontWeight: FontWeight.w400),
                                );
  }

  Widget _boldText(BuildContext context,String text) {
    return Text(text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                      color: LightColor().vanishing,
                                      fontWeight: FontWeight.w700),
                                );
  }
}



