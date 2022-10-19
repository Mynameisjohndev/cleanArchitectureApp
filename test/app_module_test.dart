import 'package:clean_architecture_app/modules/search/domain/useCases/search_by_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test("Deve recuperar o useCase sem erro", (){
    final useCase = Bind.instance<SearchByText>;
    expect(useCase, isA<SearchByTextImpl>());
  });

}