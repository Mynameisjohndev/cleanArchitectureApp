// import '../../domain/entities/result_search.dart';
import '../models/result_search_model.dart';

abstract class SearchDataSource{

  Future<List<ResultSearchModel>?> getSearch(String? searchText);

}