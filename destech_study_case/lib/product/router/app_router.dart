import 'package:destech_study_case/fakeapi_resource/view/detail_book_view.dart';
import 'package:destech_study_case/fakeapi_resource/view/favorite_books_view.dart';
import 'package:destech_study_case/fakeapi_resource/view/home_view.dart';
import 'package:destech_study_case/fakeapi_resource/view/lottie_loading_view.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/theme_cubit.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:destech_study_case/product/service/project_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppRouterEnums{init,home,detailBook,favoriteBook}

extension ApprouterEnumsExtension on AppRouterEnums {
  String get withParaf => "/$name";
}

class AppRouter {
  final FakeApiCubit fakeApiCubit = FakeApiCubit(
      FakeApiService(ProjectNetworkManager.manager.service));

  static const paraf = "/";

  Route<dynamic> _navigateToWidget(Widget child){
    return MaterialPageRoute(builder: (context) =>
        MultiBlocProvider(
          providers: [
            BlocProvider.value(
                value: fakeApiCubit,),
            BlocProvider<ThemeCubit>(
                create: (context) => ThemeCubit())
          ],
          child: child,
          ),
        );
  }

  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {

    if(routeSettings.name?.isEmpty ?? true) {
      return _navigateToWidget(LottieLoadingView());
    }

    final _routes = routeSettings.name == (AppRouter.paraf)
      ? AppRouterEnums.init
      : AppRouterEnums.values.byName(routeSettings.name!.substring(1));;

      switch(_routes){
        case AppRouterEnums.init:
          return _navigateToWidget(LottieLoadingView());

        case AppRouterEnums.home:
          return _navigateToWidget(HomeView());

        case AppRouterEnums.detailBook:
          //final args = routeSettings.arguments as HomeView;
          //return _navigateToWidget(DetailBookView(model: args.clickedBook));
          return _navigateToWidget(DetailBookView());


        case AppRouterEnums.favoriteBook:
          return _navigateToWidget(FavoriteBooksView());

        default :
        return MaterialPageRoute(builder: (_) => Scaffold(body: Container()));
      }
  }

  void dispose(){
    fakeApiCubit.close();
  }
}