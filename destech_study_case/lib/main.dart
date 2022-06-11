import 'package:destech_study_case/fakeapi_resource/view/favorite_books_view.dart';
import 'package:destech_study_case/fakeapi_resource/view/home_view.dart';
import 'package:destech_study_case/fakeapi_resource/view/lottie_loading_view.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/product/router/app_router.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:destech_study_case/product/service/project_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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


