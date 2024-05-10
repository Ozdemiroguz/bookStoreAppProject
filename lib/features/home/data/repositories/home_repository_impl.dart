import 'package:book_store/constants/api_endpoints.dart';
import 'package:book_store/features/home/data/repositories/DTOs/bookDto/book_dto.dart';
import 'package:book_store/features/home/data/repositories/DTOs/bookcategoryDto/bookcategory_dto.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../services/network/network_service.dart';

import '../../domain/models/book.dart';
import '../../domain/models/book_category.dart';
import '../../domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
final class HomeRepositoryImpl implements HomeRepository {
  final NetworkService _networkService;

  HomeRepositoryImpl(
    this._networkService,
  );

  @override
  Future<Either<Failure, List<BookCategory>>> getCategories() async {
    final response = await _networkService.get(Endpoints.categories);

    return response.fold(
      (l) => left(Failure.unknownError(l.message)),
      (r) => r.data!.extract<List>('category').fold(
            () =>
                left(const Failure.unknownError("Error extracting categories")),
            (categories) => right(categories
                .map(
                  (category) =>
                      BookCategoryDto.fromJson(category as Map<String, dynamic>)
                          .toDomain(),
                )
                .toList()),
          ),
    );
  }

  @override
  Future<Either<Failure, List<Book>>> getBooksByCategory(int categoryId) async {
    final response = await _networkService
        .get(Endpoints.booksByCategory(categoryId: categoryId));

    return response.fold(
      (l) => left(Failure.unknownError(l.message)),
      (r) => r.data!.extract<List>('product').fold(
            () => left(const Failure.unknownError("Error extracting lobbies")),
            (books) => right(
              books
                  .map(
                    (book) => BookDto.fromJson(book as Map<String, dynamic>)
                        .toDomain(),
                  )
                  .toList(),
            ),
          ),
    );
  }

  @override
  Future<Either<Failure, String>> getBookImage(String bookImageName) async {
    final response = await _networkService.post(
      Endpoints.bookImage,
      data: {
        'fileName': bookImageName,
      },
    );
    return response.fold(
      (l) => left(Failure.unknownError(l.message)),
      (r) => r.data!.extract<Map<String, dynamic>>('action_product_image').fold(
            () => left(
                const Failure.unknownError("Error extracting product image")),
            (map) => map['url'] == null
                ? left(const Failure.unknownError(
                    "URL not found in product image data"))
                : right(map['url'].toString()),
          ),
    );
  }
}
