import 'package:corona/helper/contry_to_code.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('test country code', (){
    CountryToCode code = new CountryToCode("United Kingdom");
    expect(code.getCode(), "ID");
  });
}