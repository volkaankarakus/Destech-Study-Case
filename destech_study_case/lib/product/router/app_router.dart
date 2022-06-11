import 'package:destech_study_case/fakeapi_resource/view/detail_book_view.dart';
import 'package:destech_study_case/fakeapi_resource/view/favorite_books_view.dart';
import 'package:destech_study_case/fakeapi_resource/view/home_view.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:destech_study_case/product/service/project_network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppRouterEnums{home,detailBook,favoriteBook}

class AppRouter {
  final FakeApiCubit _fakeApiCubit = FakeApiCubit(
      FakeApiService(ProjectNetworkManager.manager.service));

  static const paraf = '/';

  Route<dynamic> _navigateToWidget(Widget child){
    return MaterialPageRoute(builder: (_) =>
        BlocProvider.value(
          value: _fakeApiCubit,
          child: child,
        ));
  }

  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    if(routeSettings.name == paraf){
      _navigateToWidget(HomeView());
    }
    else if(routeSettings.name == '/detailBookView'){
      _navigateToWidget(DetailBookView());
    }
    else if(routeSettings.name == '/favoriteBooksView'){
      _navigateToWidget(FavoriteBooksView());
    }
    return MaterialPageRoute(builder: (_) => Scaffold(body: Container()));
  }

  void dispose(){
    _fakeApiCubit.close();
  }
}