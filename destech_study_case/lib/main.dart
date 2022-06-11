import 'package:destech_study_case/fakeapi_resource/view/home_view.dart';
import 'package:destech_study_case/fakeapi_resource/view/lottie_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:destech_study_case/product/router/app_router.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: context.watch<ThemeNotifier>().currentTheme,
      theme: ThemeData.dark(),
      // onGenerateInitialRoutes: ,
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context){
          return LottieLoadingView();
        });
      },
      onGenerateRoute: _appRouter.onGenerateRoute,
      // Generate routes were used instead of global access.
      //    (in terms of the development of the pages)
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}


