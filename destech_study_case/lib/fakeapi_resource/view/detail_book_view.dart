import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/fakeapi_resource/view/home_view.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/product/constant/k_items.dart';
import 'package:destech_study_case/product/constant/padding_items.dart';
import 'package:destech_study_case/product/widget/body_list_card_widget.dart';
import 'package:flutter/material.dart';

class DetailBookView extends StatefulWidget {
  DetailBookView({Key? key, this.model}) : super(key: key);

  Data? model;

  @override
  State<DetailBookView> createState() => _DetailBookViewState();
}

class _DetailBookViewState extends State<DetailBookView> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('${widget.model?.title}' ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
        ),
        // body: Center(
        //     child: Column(children: [
        //       SizedBox(
        //         height: 700,
        //         child: Padding(
        //           padding: PaddingItems.all(),
        //           child: Column(children: [
        //             Expanded(
        //                 child: Hero(tag : model.selectedData!,
        //                   child: Image.network(
        //                     '${args.selectedData.image}',
        //                     fit: BoxFit.cover,
        //                   ),
        //                 )),
        //             Padding(
        //               padding: PaddingItems.topNormal(),
        //               child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: [
        //                     Text(
        //                       widget.model?.description ?? '',
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .subtitle1
        //                           ?.copyWith(fontWeight: FontWeight.w400),
        //                     )
        //                   ]),
        //             ),
        //           ]),
        //         ),
        //       )
        //     ]),
        // )
    );
  }
}
