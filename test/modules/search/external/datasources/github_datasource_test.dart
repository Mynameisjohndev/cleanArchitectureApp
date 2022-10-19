import 'dart:convert';

import 'package:clean_architecture_app/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_result_search.dart';

class DioMock extends Mock implements Dio {
  @override
    Future<Response<T>> get<T>(
    String? path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  });
}

main() {
  final dio = DioMock();
  final datasource = GithubDataSource(dio);

  test("Deve retornar uma lista de ResultSearchModel", () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(githubResult), statusCode: 200, requestOptions: RequestOptions(path: "")));
    final result = datasource.getSearch("searchText");
    expect(result, completes);
  });
}
