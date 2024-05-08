import 'package:book_store/core/models/failure/failure.dart';
import 'package:book_store/features/home/domain/models/book.dart';
import 'package:book_store/features/home/domain/models/book_category.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<BookCategory>>> getCategories();
  Future<Either<Failure, List<Book>>> getBooksByCategory(int categoryId);
  Future<Either<Failure,String>> getBookImage(String bookImageName) ;
  }
