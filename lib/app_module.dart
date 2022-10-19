import 'package:clean_architecture_app/modules/app_widget.dart';
import 'package:clean_architecture_app/modules/search/domain/useCases/search_by_text.dart';
import 'package:clean_architecture_app/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_architecture_app/modules/search/infra/repositories/search_repository_implementation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    // Bind((i)=> SearchByTextImpl(i())),
    // Bind((i)=> SearchRepositoryImplementation(i())),
    // Bind((i)=> GithubDataSource(i())),
    // Bind((i)=> Dio()),
    Bind.factory<Dio>((i) => Dio()),
    Bind.factory((i) => SearchByTextImpl(i()))
  ];

  @override
  List<Router> get routers => throw UnimplementedError();

  @override
  Widget get bootstrap => AppWidget();
}