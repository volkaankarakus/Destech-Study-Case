import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:destech_study_case/product/service/project_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  late IFakeApiService fakeApiService;
  List<Data> books = [];

  setUp(() {
    fakeApiService = FakeApiService(ProjectNetworkManager.manager.service);

  });
  test('fetchBookItem() - Test', ()async{
    books = (await fakeApiService.fetchBookItem())?.data ?? [];
    expect(books, isNotEmpty);
  });
}