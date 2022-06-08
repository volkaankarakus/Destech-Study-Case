import 'package:dio/dio.dart';

class ProjectDioMixin{
  final service = Dio(BaseOptions(baseUrl: 'https://fakerapi.it/api/'));
}