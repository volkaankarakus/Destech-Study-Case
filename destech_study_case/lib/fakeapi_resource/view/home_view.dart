import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/home_view_model.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:destech_study_case/product/constant/k_items.dart';
import 'package:destech_study_case/product/router/app_router.dart';

import 'package:destech_study_case/product/widget/body_list_card_widget.dart';
import 'package:destech_study_case/product/widget/loading_center_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FakeApiCubit, FakeApiState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: _loadingCenterBloc(),
              actions: [
                BlocConsumer<FakeApiCubit, FakeApiState>(
                  listener: (context, state) {
                    if (state.isClickedToFavList ?? false) {
                      Navigator.of(context).pushNamed(
                          AppRouterEnums.favoriteBook.withParaf);
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          context.read<FakeApiCubit>()
                              .changeIsClickedToFavList();
                        },
                        icon: Icon(Icons.favorite_border));
                  },
                )
              ],
            ),
            body: BlocListener<FakeApiCubit,FakeApiState>(
              listener: (context, state) {
                final notificationSnackBar = SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.red,
                    content: Text(
                        'isTapped : ' + state.isTapped.toString()
                            + ', isLiked : ' + state.isLiked.toString())
                );
                ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
              },
              child: Column(
                children: [
                  TextField(
                    textCapitalization: TextCapitalization.none,
                    //default lowercase
                    onChanged: (value) {
                      context.read<FakeApiCubit>().searchByTitle(value);
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder()
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Here is the books!'),
                      InkWell(
                          onTap: () {},
                          child: Text('See all'))
                    ],
                  ),
                  Expanded(
                    child: SafeArea(
                      child: _bodyListViewBloc(),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  Widget _bodyListViewBloc() {
    return BlocBuilder<FakeApiCubit, FakeApiState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.books?.length ?? kZero.toInt(),
          itemBuilder: (BuildContext context, int index) =>
              Column(
                children: [
                  Card(
                    child: BodyListCardWidget(
                      model: state.books?[index],
                      // isTapped: state.isTapped ?? false,
                    ),
                  ),
                  IconButton(onPressed: () {},
                      icon: Icon(Icons.add))
                ],
              ),
        );
      },
    );
  }

  Widget _loadingCenterBloc() {
    return BlocSelector<FakeApiCubit, FakeApiState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
            opacity: state ? kOne : kZero,
            duration: DurationItems.durationHigh(),
            child: LoadingCenter());
      },
    );
  }
}