import 'package:clean_architecture_app/modules/search/infra/datasources/search_datasources.dart';
import 'package:clean_architecture_app/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

class GithubDataSource implements SearchDataSource{

  final Dio dio;
  GithubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>?> getSearch(String? searchText) {
    dio.
  }
  
}