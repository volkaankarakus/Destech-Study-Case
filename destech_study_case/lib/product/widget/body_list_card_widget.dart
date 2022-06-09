import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/product/constant/padding_items.dart';
import 'package:flutter/material.dart';
import '../utility/utility_network_image.dart';


class BodyListCardWidget extends StatelessWidget {
  const BodyListCardWidget({Key? key, this.model}) : super(key: key);
  final Data? model;

  @override
  Widget build(BuildContext context) {
    if(model == null) return SizedBox.shrink();
    return Padding(
      padding: PaddingItems.all(),
      child: Card(
        child: ListTile(
          title: UtilityNetworkImage.network(src: model?.image),
          subtitle: Text('${model?.description}'),
        ),
      ),
    );
  }
}
