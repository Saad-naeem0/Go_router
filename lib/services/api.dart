import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../model/cat_model.dart';

part 'api.g.dart';

@RestApi(baseUrl:"https://catfact.ninja/" )
abstract class CatClient{

  factory CatClient(Dio dio, {String baseUrl}) = _CatClient;

  @GET("fact")
  Future<CatFacts> CatFact();

}
// final client = CatClient(dio, baseUrl: baseUrl);