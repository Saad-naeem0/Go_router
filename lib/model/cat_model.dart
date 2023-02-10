import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class CatFacts{
  final String fact;
  final int length;

  CatFacts(this.fact, this.length);

  factory CatFacts.fromJson(Map<String, dynamic> json) => _$CatFactsFromJson(json);
  Map<String, dynamic> toJson() => _$CatFactsToJson(this);


}