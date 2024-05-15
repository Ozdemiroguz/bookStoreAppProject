import 'package:book_store/core/models/failure/failure.dart';
import 'package:book_store/features/home/domain/models/book.dart';
import 'package:book_store/features/home/domain/models/book_category.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'books_state.freezed.dart';

@freezed
class BooksState with _$BooksState {
  factory BooksState({
    required bool isLoading,
    required Map<int, List<Book>> books,
    required Map<int, List<Book>> filteredBooks,
    required Map<int, Option<Failure>> failures,
    required List<BookCategory> bookCategories,
    required List<int> categoryIds,
    required int selectedCategoryId,
    required String searchQuery,
    required bool favorited,
  }) = _BooksState;

  factory BooksState.initial() => BooksState(
        isLoading: false,
        books: {},
        filteredBooks: {},
        failures: {},
        bookCategories: [],
        categoryIds: [],
        selectedCategoryId: -1,
        searchQuery: '',
        favorited: false,
      );
}
