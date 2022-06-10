//////////////////////////////////////////////////////////////
// *** THIS SCRIPT IS USELESS AFTER ADDING CUBITS ************
//////////////////////////////////////////////////////////////

import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/fakeapi_resource/view/home_view.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:destech_study_case/product/service/project_network_manager.dart';
import 'package:flutter/material.dart';

//https://fakerapi.it/api/v1/books?_quantity=100
abstract class HomeViewModel extends State<HomeView> {
  late final IFakeApiService fakeApiService;
  bool isLoading = false;
  List<Data> books = [];

  @override
  void initState() {
    super.initState();
    fakeApiService = FakeApiService(ProjectNetworkManager.manager.service);
    _fetch();
  }

  void changeLoading(){
    setState((){
      isLoading = !isLoading;
    });
  }

  Future<void> _fetch() async{
    changeLoading();
    books = (await fakeApiService.fetchBookItem())?.data ?? [];
    changeLoading();
  }

}