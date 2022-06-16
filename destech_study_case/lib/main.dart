import 'package:destech_study_case/fakeapi_resource/view/lottie_loading_view.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:destech_study_case/product/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<FakeApiCubit>(
              create: (context) => AppRouter().fakeApiCubit),
          BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit())
        ],
        child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //theme: LightTheme().theme,
          theme: state.currentTheme,
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (context) {
              return LottieLoadingView();
            });
          },
          onGenerateRoute: _appRouter.onGenerateRoute,
          // Generate routes were used instead of global access.
          //    (in terms of the development of the pages)
        );
      },
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}


