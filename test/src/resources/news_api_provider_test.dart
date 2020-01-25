import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';


import 'dart:convert';

import 'package:news/src/resources/news_api_provider.dart';

void main(){
  test('Fetching top ids',() async{
    final testApi=NewsApiProvider();

    testApi.client=MockClient((request) async {
      return Response(json.encode([1,2,3,4,5]),200);
    });

    final ids=await testApi.fetchTopIds();

    expect(ids, [1,2,3,4,5]);

  });

  test('Fetching Specific Item',() async{
    final testApi=NewsApiProvider();

    testApi.client=MockClient((request) async{
      return Response(json.encode({'id':123}),200);
    });

    final obj=await testApi.fetchItem(987);

    expect(obj.id,123);
  });
}