import 'dart:io';

import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:dio/dio.dart';

//https://fakerapi.it/api/v1/books?_quantity=100

abstract class IFakeApiService{
  IFakeApiService(this.dio);

  final Dio dio;

  Future<BookModel?> fetchBookItem();
}

class FakeApiService extends IFakeApiService{
  FakeApiService(Dio dio) : super(dio);

  @override
  Future<BookModel?> fetchBookItem() async{
    final response = await dio.get('v1/books?_quantity=100');
    if(response.statusCode == HttpStatus.ok){ // 200
      final jsonBody = response.data;
      if(jsonBody is Map<String,dynamic>) {
        return BookModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}

enum _FakeApiPath{resource}