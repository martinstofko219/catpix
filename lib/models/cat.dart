import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat {
  final String id;
  final String url;
  final List<CatCategory> categories;

  Cat({this.id, this.url, this.categories});

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}

@JsonSerializable()
class CatCategory {
  final int id;
  final String name;

  CatCategory({this.id, this.name});

  factory CatCategory.fromJson(Map<String, dynamic> json) =>
      _$CatCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CatCategoryToJson(this);
}
