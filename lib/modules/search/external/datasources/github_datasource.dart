import 'package:clean_architecture_app/modules/search/infra/datasources/search_datasources.dart';
import 'package:clean_architecture_app/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

extension on String{
  normalizeText(){
    return this.replaceAll(" ", "+");
  }
}

class GithubDataSource implements SearchDataSource{

  final Dio dio;
  GithubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>?> getSearch(String? searchText) async{
    final response = await dio.get("https://api.github.com/search/users?q=${searchText!.normalizeText()}");
    print("Status code");
    if(response.statusCode == 200) {
      // final formatedReturn = response as List<ResultSearchModel>?;
      final list = (response.data["items"] as List).map((e) => ResultSearchModel?.fromMap(e)).toList();
      return list;
    }
  }
  
}