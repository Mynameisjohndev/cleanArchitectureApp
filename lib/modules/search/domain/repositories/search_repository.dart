import 'package:clean_architecture_app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_app/modules/search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository{
  // Future<Either<FailureSearch, List<ResultSearch>?>>? search(String? searchText);
  Future<Either<FailureSearch, List<ResultSearch>?>> search(String? searchText);

}