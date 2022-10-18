import 'package:clean_architecture_app/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_architecture_app/modules/search/infra/datasources/search_datasources.dart';
import 'package:clean_architecture_app/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio{}

main(){

  final dio = DioMock();
  final datasource = GithubDataSource(dio);

  test("Deve retornar uma lista de ResultSearchModel", () async {

    when(dio.get("")).thenAnswer((_) async => Response(data: {}, statusCode: 200, requestOptions: RequestOptions(path: "/")));
    final result = datasource.getSearch("searchText");
    expect(result, completes);
  });

}