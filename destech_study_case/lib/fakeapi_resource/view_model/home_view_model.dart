import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/fakeapi_resource/service/fakeapi_service.dart';
import 'package:destech_study_case/fakeapi_resource/view/home_view.dart';
import 'package:destech_study_case/product/mixin/product_dio_mixin.dart';
import 'package:flutter/material.dart';
//https://fakerapi.it/api/v1/books?_quantity=100

abstract class HomeViewModel extends State<HomeView> with ProjectDioMixin{
  late final IFakeApiService fakeApiService;
  bool isLoading = false;
  List<Data> books = [];

  @override
  void initState() {
    super.initState();
    fakeApiService = FakeApiService(service);
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