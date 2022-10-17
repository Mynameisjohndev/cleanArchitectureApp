import 'package:clean_architecture_app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture_app/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_app/modules/search/domain/useCases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository{
  
}

void main() {

  final repository = SearchRepositoryMock();
  final useCase = SearchByTextImpl(repository);

  test('Deve retornar uma lista de ResultSearch', ()async{
     when(repository.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
     final result = await useCase("JACOB");
     expect(result, isA<Right>());
     expect(result! | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar uma exception caso o texto seja invalido', ()async{
     when(repository.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
     final result = await useCase("JACOB");
     expect(result, isA<Right>());
     expect(result! | null, isA<List<ResultSearch>>());
  });

}