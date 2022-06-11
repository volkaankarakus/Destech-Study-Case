import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:destech_study_case/product/constant/lottie_items.dart';
import 'package:destech_study_case/product/router/app_router.dart';
import 'package:destech_study_case/product/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoadingView extends StatefulWidget {
  const LottieLoadingView({Key? key}) : super(key: key);

  @override
  State<LottieLoadingView> createState() => _LottieLoadingViewState();
}

class _LottieLoadingViewState extends State<LottieLoadingView> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    navigateToHome();
  }

  Future<void> navigateToHome()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed(AppRouterEnums.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async{
              await controller.animateTo(isLight ? 0.5 : 1);
              isLight = !isLight;
              Future.microtask(() {
                //context.read<ThemeNotifier>().changeTheme();

              });
              },
            child: Lottie.asset(
                LottieItems.themeChange.lottiePath,
                repeat: false,
                controller: controller,
            ),
          )
        ],
      ),
      body: Center(
        child: Lottie.asset(LottieItems.loadingLight.lottiePath),
      ),
    );
  }
}
