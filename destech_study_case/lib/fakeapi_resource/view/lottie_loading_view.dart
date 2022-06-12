import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:destech_study_case/product/constant/lottie_items.dart';
import 'package:destech_study_case/product/router/app_router.dart';
import 'package:destech_study_case/product/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LottieLoadingView extends StatefulWidget {
  const LottieLoadingView({Key? key}) : super(key: key);

  @override
  State<LottieLoadingView> createState() => _LottieLoadingViewState();
}

class _LottieLoadingViewState extends State<LottieLoadingView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationXHigh());
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(DurationItems.durationXHigh());
    Navigator.of(context).pushReplacementNamed(AppRouterEnums.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FakeApiCubit, FakeApiState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Lottie.asset(LottieItems.loadingLight.lottiePath),
          ),
        );
      },
    );
  }
}
