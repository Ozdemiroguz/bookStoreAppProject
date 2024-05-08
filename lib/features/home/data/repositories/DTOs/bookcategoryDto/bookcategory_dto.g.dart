// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookCategoryDtoImpl _$$BookCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BookCategoryDtoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$BookCategoryDtoImplToJson(
        _$BookCategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.created_at,
    };
