// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookDtoImpl _$$BookDtoImplFromJson(Map<String, dynamic> json) =>
    _$BookDtoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      author: json['author'] as String,
      cover: json['cover'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      sales: json['sales'] as int,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$$BookDtoImplToJson(_$BookDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'cover': instance.cover,
      'description': instance.description,
      'price': instance.price,
      'sales': instance.sales,
      'slug': instance.slug,
    };
