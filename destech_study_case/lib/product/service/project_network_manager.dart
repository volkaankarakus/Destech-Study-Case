import 'package:dio/dio.dart';

// The project must be managed through a single Dio and this manager cannot be manipulated.(SINGLETON)
class ProjectNetworkManager{
  late final Dio _dio;

  ProjectNetworkManager._(){
    _dio = Dio(BaseOptions(baseUrl: 'https://fakerapi.it/'));
  }

  static ProjectNetworkManager manager = ProjectNetworkManager._();

  Dio get service => _dio;

}