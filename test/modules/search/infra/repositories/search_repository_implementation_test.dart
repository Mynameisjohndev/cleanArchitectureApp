import 'package:clean_architecture_app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_app/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_app/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_app/modules/search/domain/useCases/search_by_text.dart';
import 'package:clean_architecture_app/modules/search/infra/datasources/search_datasources.dart';
import 'package:clean_architecture_app/modules/search/infra/models/result_search_model.dart';
import 'package:clean_architecture_app/modules/search/infra/repositories/search_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource{}

void main() {

  final datasource = SearchDataSourceMock();
  final repository = SearchRepositoryImplementation(datasource);

  test("Deve retornar uma lista de ResultSearch", () async {
    when(datasource.getSearch(any)).thenAnswer((realInvocation) async => <ResultSearchModel>[]);
    final result = await repository.search("jacob");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test("Deve retornar um erro se o datasource falhar", () async {
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.search("jacob");
    expect(result.fold(id, id), isA<DataSourceError>());
  });

}
