import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/theme_cubit.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/home_view_model.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:destech_study_case/product/constant/k_items.dart';
import 'package:destech_study_case/product/constant/lottie_items.dart';
import 'package:destech_study_case/product/constant/padding_items.dart';
import 'package:destech_study_case/product/router/app_router.dart';
import 'package:destech_study_case/product/theme/light_theme.dart';
import 'package:destech_study_case/product/utility/utility_search_delegate.dart';
import 'package:destech_study_case/product/widget/search_row_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:destech_study_case/product/widget/body_list_card_widget.dart';
import 'package:destech_study_case/product/widget/loading_center_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationXHigh());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FakeApiCubit, FakeApiState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              //title: ,
              actions: [
                _wrapWithCircularContainer(
                    IconButton(
                    onPressed: () {
                      //context.read<FakeApiCubit>().changeisClickedSearch();
                    },
                    icon: Icon(Icons.search)
                )),
                _wrapWithCircularContainer(InkWell(
                  onTap: () async {
                    await controller.animateTo(isLight ? 0.5 : 1);
                    isLight = !isLight;
                    Future.microtask(() {
                      context.read<ThemeCubit>().changeTheme();
                    });
                  },
                  child: Lottie.asset(
                    LottieItems.themeChange.lottiePath,
                    repeat: false,
                    controller: controller,
                  ),
                ),),
                _wrapWithCircularContainer(IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRouterEnums.favoriteBook.withParaf);
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      size: 32,
                    )),),
              ],
            ),
            body: BlocListener<FakeApiCubit, FakeApiState>(
              listener: (context, state) {
                final notificationSnackBar = SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.red,
                    content:
                        Text('isLiked : ' + state.isLiked.toString() + ''));
                ScaffoldMessenger.of(context)
                    .showSnackBar(notificationSnackBar);
              },
              child: SafeArea(
                child: Padding(
                  padding: PaddingItems.horizontalNormal(),
                  child: Column(
                    children: [
                      Row(
                          children: [
                            Text('My',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                      color: LightColor().jacaranda,
                                      fontWeight: FontWeight.w700)),
                            Text(
                              ' Books',
                              style: Theme.of(context).textTheme.headline5?.copyWith(
                                color: LightColor().jacaranda,
                              ),
                            ),
                          ]),
                      SizedBox(height: 20,),
                      SearchRowWidget(),
                      SizedBox(height: 10,),
                      Expanded(
                        child: bodyListViewBloc(),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget _wrapWithCircularContainer(Widget? widget) {
    return Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle
                ),
                child: widget,
              );
  }

  Widget bodyListViewBloc() {
    return BlocBuilder<FakeApiCubit, FakeApiState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.books?.length ?? kZero.toInt(),
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              Padding(
                padding: PaddingItems.bottomNormal(),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRouterEnums.detailBook.withParaf,
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: LightColor().fuchsiaNebula,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: BodyListCardWidget(
                      model: state.books?[index],
                    ),
                  ),
                ),
              ),
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
