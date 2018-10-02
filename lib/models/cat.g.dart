// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) {
  return Cat(
      id: json['id'] as String,
      url: json['url'] as String,
      categories: (json['categories'] as List)
          ?.map((e) => e == null
              ? null
              : CatCategory.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'categories': instance.categories
    };

CatCategory _$CatCategoryFromJson(Map<String, dynamic> json) {
  return CatCategory(id: json['id'] as int, name: json['name'] as String);
}

Map<String, dynamic> _$CatCategoryToJson(CatCategory instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
