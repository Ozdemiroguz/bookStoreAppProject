// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookcategory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookCategoryDto _$BookCategoryDtoFromJson(Map<String, dynamic> json) {
  return _BookCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$BookCategoryDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCategoryDtoCopyWith<BookCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCategoryDtoCopyWith<$Res> {
  factory $BookCategoryDtoCopyWith(
          BookCategoryDto value, $Res Function(BookCategoryDto) then) =
      _$BookCategoryDtoCopyWithImpl<$Res, BookCategoryDto>;
  @useResult
  $Res call({int id, String name, String created_at});
}

/// @nodoc
class _$BookCategoryDtoCopyWithImpl<$Res, $Val extends BookCategoryDto>
    implements $BookCategoryDtoCopyWith<$Res> {
  _$BookCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? created_at = null,
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
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookCategoryDtoImplCopyWith<$Res>
    implements $BookCategoryDtoCopyWith<$Res> {
  factory _$$BookCategoryDtoImplCopyWith(_$BookCategoryDtoImpl value,
          $Res Function(_$BookCategoryDtoImpl) then) =
      __$$BookCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String created_at});
}

/// @nodoc
class __$$BookCategoryDtoImplCopyWithImpl<$Res>
    extends _$BookCategoryDtoCopyWithImpl<$Res, _$BookCategoryDtoImpl>
    implements _$$BookCategoryDtoImplCopyWith<$Res> {
  __$$BookCategoryDtoImplCopyWithImpl(
      _$BookCategoryDtoImpl _value, $Res Function(_$BookCategoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? created_at = null,
  }) {
    return _then(_$BookCategoryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookCategoryDtoImpl extends _BookCategoryDto {
  const _$BookCategoryDtoImpl(
      {required this.id, required this.name, required this.created_at})
      : super._();

  factory _$BookCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookCategoryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String created_at;

  @override
  String toString() {
    return 'BookCategoryDto(id: $id, name: $name, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookCategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, created_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookCategoryDtoImplCopyWith<_$BookCategoryDtoImpl> get copyWith =>
      __$$BookCategoryDtoImplCopyWithImpl<_$BookCategoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _BookCategoryDto extends BookCategoryDto {
  const factory _BookCategoryDto(
      {required final int id,
      required final String name,
      required final String created_at}) = _$BookCategoryDtoImpl;
  const _BookCategoryDto._() : super._();

  factory _BookCategoryDto.fromJson(Map<String, dynamic> json) =
      _$BookCategoryDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$BookCategoryDtoImplCopyWith<_$BookCategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
