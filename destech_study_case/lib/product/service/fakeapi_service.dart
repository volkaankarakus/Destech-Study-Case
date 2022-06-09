import 'dart:io';
import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/product/constant/query_items.dart';
import 'package:dio/dio.dart';

//https://fakerapi.it/api/v1/books?_quantity=100
enum _FakeApiServicePath{api,v1,books}

abstract class IFakeApiService{
  IFakeApiService(this.dio);

  final Dio dio;

  Future<BookModel?> fetchBookItem({int count = 100});
}

class FakeApiService extends IFakeApiService{
  FakeApiService(Dio dio) : super(dio);

  @override
  Future<BookModel?> fetchBookItem({int count = 100}) async{
    final response = await dio.get(
        '${_FakeApiServicePath.api.name}/${_FakeApiServicePath.v1.name}/${_FakeApiServicePath.books.name}',
        queryParameters:Map.fromEntries(
            {QueryItems.quantity.toMapEntry('$count')}.toList()) );
    if(response.statusCode == HttpStatus.ok){ //200
      final jsonBody = response.data;
      if(jsonBody is Map<String,dynamic>) {
        return BookModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}

