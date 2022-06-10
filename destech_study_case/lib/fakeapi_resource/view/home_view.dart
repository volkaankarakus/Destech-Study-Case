import 'package:destech_study_case/fakeapi_resource/view_model/cubit/fake_api_cubit.dart';
import 'package:destech_study_case/fakeapi_resource/view_model/home_view_model.dart';
import 'package:destech_study_case/product/constant/duration_items.dart';
import 'package:destech_study_case/product/constant/k_items.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:destech_study_case/product/service/project_network_manager.dart';
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
    return BlocProvider(
      create: (context) =>
          FakeApiCubit(FakeApiService(ProjectNetworkManager.manager.service)),
      child: Scaffold(
        appBar: AppBar(
          title: isLoading ? CircularProgressIndicator() : null,
          leading: _loadingCenterBloc(),
        ),
        body: _bodyListViewBloc(),

      ),
    );
  }

  Widget _bodyListViewBloc() {
    return BlocBuilder<FakeApiCubit,FakeApiState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.books?.length ?? kZero.toInt(),
            itemBuilder: (BuildContext context, int index) =>
                BodyListCardWidget(model: state.books?[index]));
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
