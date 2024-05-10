import 'package:book_store/core/models/failure/failure.dart';
import 'package:book_store/features/home/domain/models/book_category.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  factory CategoriesState({
    required bool isLoading,
    required List<BookCategory> categories,
    required Option<Failure> failure,
  }) = _CategoriesState;

  factory CategoriesState.initial() => CategoriesState(
        isLoading: false,
        categories: [],
        failure: none(),
      );
}
