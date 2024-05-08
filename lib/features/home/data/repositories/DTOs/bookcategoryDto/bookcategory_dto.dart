import 'package:book_store/features/home/domain/models/book_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookcategory_dto.freezed.dart';
part 'bookcategory_dto.g.dart';

@freezed
class BookCategoryDto with _$BookCategoryDto {
  const factory BookCategoryDto({
    required int id,
    required String name,
    required String created_at,
  }) =_BookCategoryDto;

  factory BookCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryDtoFromJson(json);

  const BookCategoryDto._();

  BookCategory toDomain() => BookCategory(
        id: id,
        name: name,
        created_at: created_at,
      );
}
