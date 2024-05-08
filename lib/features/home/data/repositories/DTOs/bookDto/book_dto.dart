import 'package:book_store/features/home/domain/models/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_dto.freezed.dart';
part 'book_dto.g.dart';

@freezed
class BookDto with _$BookDto {
  const factory BookDto({
    required int id,
    required String name,
    required String author,
    required String cover,
    required String description,
    required double price,
    required int sales,
    required String slug,
  }) = _BookDto;

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  const BookDto._();

  Book toDomain() => Book(
        id: id,
        name: name,
        author: author,
        cover: cover,
        description: description,
        price: price,
        sales: sales,
        slug: slug,
      );
}
