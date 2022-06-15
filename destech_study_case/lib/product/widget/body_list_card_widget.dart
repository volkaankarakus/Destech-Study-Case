import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:destech_study_case/product/router/app_router.dart';
import 'package:destech_study_case/product/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utility/utility_network_image.dart';
import 'package:like_button/like_button.dart';


class BodyListCardWidget extends StatefulWidget {
  BodyListCardWidget({Key? key,
    required this.model,}) : super(key: key);

  final Data? model;

  @override
  State<BodyListCardWidget> createState() => _BodyListCardWidgetState();
}

class _BodyListCardWidgetState extends State<BodyListCardWidget> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    if (widget.model == null) return SizedBox.shrink();
    return ListTile(
      leading: Container(
          width: 40,
          height: 80,
          child: CircleAvatar(
            backgroundColor: LightColor().amour,
            radius: 100,
              child: UtilityNetworkImage.network(src: widget.model?.image))),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text('${widget.model?.title}',style: Theme.of(context).textTheme.headline6,),
            SizedBox(height: 10,),
            Text('${widget.model?.author}',style: Theme.of(context).textTheme.subtitle2),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.model?.genre}',style: Theme.of(context).textTheme.caption),
                Text('${widget.model?.published}',style: Theme.of(context).textTheme.caption),
              ],
            ),          ],
        ),

      //subtitle: ,
      trailing: Container(
        //color: Colors.amberAccent,
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
    );
  }
}