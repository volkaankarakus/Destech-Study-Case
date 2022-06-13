import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/theme_cubit.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/home_view_model.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:destech_study_case/product/constant/k_items.dart';
import 'package:destech_study_case/product/constant/lottie_items.dart';
import 'package:destech_study_case/product/constant/padding_items.dart';
import 'package:destech_study_case/product/router/app_router.dart';
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
              centerTitle: true,
              title: Text('Destech',
                  style: GoogleFonts.oleoScript().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30)),
              leading: _loadingCenterBloc(),
              actions: [
                InkWell(
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
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRouterEnums.favoriteBook.withParaf);
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      size: 32,
                    )),
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
              child: Padding(
                padding: PaddingItems.horizontalNormal(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 250,
                          child: TextField(
                            textCapitalization: TextCapitalization.none,
                            //default lowercase
                            onChanged: (value) {
                              context.read<FakeApiCubit>().searchByTitle(value);
                            },
                            decoration: InputDecoration(
                                hintText: 'Search with title',
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder()),
                            style: TextStyle(fontSize: 15, height: 3),
                          ),
                        ),
                        InkWell(onTap: () {}, child: Text('See all')),
                        SizedBox.shrink()
                      ],
                    ),
                    Expanded(
                      child: SafeArea(
                        child: bodyListViewBloc(),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget bodyListViewBloc() {
    return BlocBuilder<FakeApiCubit, FakeApiState>(
      builder: (context,state) {
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
                  child: Card(
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
