import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:flutter/material.dart';
import '../utility/utility_network_image.dart';
import 'package:like_button/like_button.dart';


class BodyListCardWidget extends StatefulWidget {
   BodyListCardWidget({Key? key,
    this.model,
    this.isLiked=false,
    this.isTapped=false}) : super(key: key);

  final Data? model;
  bool isLiked ;
  bool isTapped ;

  @override
  State<BodyListCardWidget> createState() => _BodyListCardWidgetState();
}

class _BodyListCardWidgetState extends State<BodyListCardWidget> {


  @override
  Widget build(BuildContext context) {
    if (widget.model == null) return SizedBox.shrink();
    return InkWell(
          onTap: () {
            setState((){
              widget.isTapped = !(widget.isTapped);
            });
          },
          child: ListTile(
            leading: Container(
                width: 80,
                height: 80,
                child: UtilityNetworkImage.network(src: widget.model?.image)),
            title: Text('${widget.model?.title}'),
            subtitle: Text('${widget.model?.description}'),
            trailing: Container(
              width: 40,
              child: LikeButton(
                size: 20,
                isLiked : widget.isLiked,
                animationDuration: DurationItems.durationNormal(),
                onTap:(isLiked) async{
                  widget.isLiked = !isLiked;
                 return !isLiked;
                },
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
