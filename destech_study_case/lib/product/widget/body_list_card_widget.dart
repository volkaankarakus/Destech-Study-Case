import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:destech_study_case/product/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utility/utility_network_image.dart';
import 'package:like_button/like_button.dart';


class BodyListCardWidget extends StatefulWidget {
  BodyListCardWidget({Key? key,
    this.model,}) : super(key: key);

  final Data? model;

  @override
  State<BodyListCardWidget> createState() => _BodyListCardWidgetState();
}

class _BodyListCardWidgetState extends State<BodyListCardWidget> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    if (widget.model == null) return SizedBox.shrink();
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
                AppRouterEnums.detailBook.withParaf,
            );          },
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
                isLiked: _isLiked,
                size: 20,
                animationDuration: DurationItems.durationNormal(),
                onTap: (isLiked) async {
                  this._isLiked = !isLiked;
                  context.read<FakeApiCubit>().changeLikeButton(!isLiked);
                  return !isLiked;
                },
              ),
            ),
          ),
        );


  }
}