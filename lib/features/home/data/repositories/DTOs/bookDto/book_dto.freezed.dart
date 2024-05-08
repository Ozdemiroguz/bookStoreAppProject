// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookDto _$BookDtoFromJson(Map<String, dynamic> json) {
  return _BookDto.fromJson(json);
}

/// @nodoc
mixin _$BookDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get sales => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookDtoCopyWith<BookDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDtoCopyWith<$Res> {
  factory $BookDtoCopyWith(BookDto value, $Res Function(BookDto) then) =
      _$BookDtoCopyWithImpl<$Res, BookDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String author,
      String cover,
      String description,
      double price,
      int sales,
      String slug});
}

/// @nodoc
class _$BookDtoCopyWithImpl<$Res, $Val extends BookDto>
    implements $BookDtoCopyWith<$Res> {
  _$BookDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? author = null,
    Object? cover = null,
    Object? description = null,
    Object? price = null,
    Object? sales = null,
    Object? slug = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      sales: null == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookDtoImplCopyWith<$Res> implements $BookDtoCopyWith<$Res> {
  factory _$$BookDtoImplCopyWith(
          _$BookDtoImpl value, $Res Function(_$BookDtoImpl) then) =
      __$$BookDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String author,
      String cover,
      String description,
      double price,
      int sales,
      String slug});
}

/// @nodoc
class __$$BookDtoImplCopyWithImpl<$Res>
    extends _$BookDtoCopyWithImpl<$Res, _$BookDtoImpl>
    implements _$$BookDtoImplCopyWith<$Res> {
  __$$BookDtoImplCopyWithImpl(
      _$BookDtoImpl _value, $Res Function(_$BookDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? author = null,
    Object? cover = null,
    Object? description = null,
    Object? price = null,
    Object? sales = null,
    Object? slug = null,
  }) {
    return _then(_$BookDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      sales: null == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookDtoImpl extends _BookDto {
  const _$BookDtoImpl(
      {required this.id,
      required this.name,
      required this.author,
      required this.cover,
      required this.description,
      required this.price,
      required this.sales,
      required this.slug})
      : super._();

  factory _$BookDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String author;
  @override
  final String cover;
  @override
  final String description;
  @override
  final double price;
  @override
  final int sales;
  @override
  final String slug;

  @override
  String toString() {
    return 'BookDto(id: $id, name: $name, author: $author, cover: $cover, description: $description, price: $price, sales: $sales, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.sales, sales) || other.sales == sales) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, author, cover, description, price, sales, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDtoImplCopyWith<_$BookDtoImpl> get copyWith =>
      __$$BookDtoImplCopyWithImpl<_$BookDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookDtoImplToJson(
      this,
    );
  }
}

abstract class _BookDto extends BookDto {
  const factory _BookDto(
      {required final int id,
      required final String name,
      required final String author,
      required final String cover,
      required final String description,
      required final double price,
      required final int sales,
      required final String slug}) = _$BookDtoImpl;
  const _BookDto._() : super._();

  factory _BookDto.fromJson(Map<String, dynamic> json) = _$BookDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get author;
  @override
  String get cover;
  @override
  String get description;
  @override
  double get price;
  @override
  int get sales;
  @override
  String get slug;
  @override
  @JsonKey(ignore: true)
  _$$BookDtoImplCopyWith<_$BookDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
