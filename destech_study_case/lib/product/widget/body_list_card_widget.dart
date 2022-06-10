import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:flutter/material.dart';
import '../utility/utility_network_image.dart';
import 'package:like_button/like_button.dart';


class BodyListCardWidget extends StatefulWidget {
  const BodyListCardWidget({Key? key, this.model}) : super(key: key);
  final Data? model;

  @override
  State<BodyListCardWidget> createState() => _BodyListCardWidgetState();
}

class _BodyListCardWidgetState extends State<BodyListCardWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.model == null) return SizedBox.shrink();
    return InkWell(
          onTap: () {

          },
          child: ListTile(
            leading: Container(
                width: 80,
                height: 80,
                child: UtilityNetworkImage.network(src: widget.model?.image)),
            title: Text('${widget.model?.author}'),
            subtitle: Text('${widget.model?.description}'),
            trailing: Container(
              width: 40,
              child: LikeButton(
                size: 20,
                animationDuration: DurationItems.durationNormal(),
                // onTap: state.copyWith(),
              ),
            ),
          ),
        );


    // return Padding(
    //   padding: PaddingItems.all(),
    //   child: Card(
    //     child: ListTile(
    //       title: UtilityNetworkImage.network(src: model?.image),
    //       subtitle: Text('${model?.description}'),
    //       leading: TextButton(
    //           onPressed: (){
    //
    //           },
    //       child: Icon(Icons.add),),
    //       ), ,
    //     ),
    //   ),
    // );
  }
}
