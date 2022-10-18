import 'package:clean_architecture_app/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_app/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_app/modules/search/infra/datasources/search_datasources.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImplementation implements SearchRepository {
  final SearchDataSource datasource;
  SearchRepositoryImplementation(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> search(
      String? searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (error) {
      return Left(error);
    } catch (error) {
      return Left(DataSourceError());
    }
  }
}
